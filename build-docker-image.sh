#!/bin/bash

#
 # This file is licensed under the GPLv3 License.
 # Copyright © 2025 kelson8
 #
 # [https://www.gnu.org/licenses/gpl-3.0.txt]
#

# This basic script runs a docker build, then builds the public folder with hugo.

#------
# Variables
#------

# Set this to true to run the docker compose image for the nginx server and start the project.
runDockerImage=true

# Set this to true to build this image, which builds the public directory for hugo
BUILD_DOCKER_IMAGE=true

# Set this to true to reset the cache when building.
# Should be useful for when I don't change much.
BUILD_NO_CACHE=false

# If this should restart the nginx container.
# Seems to break my blog on the VPS if i don't do this
RESTART_NGINX_CONTAINER=true

# TODO Change once I publish the site.
baseURL=https://blog.local.kelsoncraft.net

# KCNet Hugo blog folder
BLOG_DIR="$HOME/git/docker-projects/ubuntu-server/kcnet-blog"
# KCNet Blog Nginx folder, and nginx data folder
NGINX_BLOG_DIR="$HOME/git/docker-projects/ubuntu-server/kcnet-blog-nginx"
NGINX_BLOG_DATA_DIR="$HOME/git/docker-projects/ubuntu-server/kcnet-blog-nginx/data"

#------
# Functions
#------

# Make this run the docker compose image if enabled

if [ $BUILD_DOCKER_IMAGE = true ]; then
    if [ $BUILD_NO_CACHE = true ]; then
        docker build --no-cache -t kcnet-blog .
    else
        docker build -t kcnet-blog .
    fi

   docker run --rm -v "$(pwd):/src" kcnet-blog hugo --destination public --baseURL "$baseURL"
fi

# Delete old nginx data directory, copy new files to the nginx data directory
if [ $runDockerImage = true ]; then
    # Remove the old data files.
    cd "$NGINX_BLOG_DIR/" || exit
    if [ -d "$NGINX_BLOG_DATA_DIR" ]; then
        echo "Deleting and re-creating nginx blog data dir."
        rm -r "$NGINX_BLOG_DATA_DIR"
        mkdir "$NGINX_BLOG_DATA_DIR"
    else
        mkdir "$NGINX_BLOG_DATA_DIR"
    fi

    # Copy new files into the public folder
    if [ ! -d "$BLOG_DIR/public" ]; then
        echo "The public directory does not exist."
        exit 1
    fi

    echo "Copying files from public folder to nginx blog data dir."
    # shellcheck disable=SC2086
    cp $BLOG_DIR/public/* "$NGINX_BLOG_DATA_DIR/" -r

    # Check if index.html exists
    if [ -f "$NGINX_BLOG_DATA_DIR/index.html" ]; then
        echo "Copied files, index.html was in the nginx data dir."
    else
        echo "File copy failed! Check the script, index.html does not exist in the data dir."
    fi
fi

# Restart nginx container.
if [ $RESTART_NGINX_CONTAINER = true ]; then
    cd "$NGINX_BLOG_DIR" || exit 1
    docker compose down
    docker compose up -d
fi