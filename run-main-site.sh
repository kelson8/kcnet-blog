#!/bin/bash

# This is a recreation of the run-hugo.bat Windows batch file.
# This is a basic script to run hugo for Linux with a specific protocol, ip, and port.
# This version of the script runs the site with the url as my reverse proxy one for development.
# To use this in production, I should run this with Nginx.

# Set this to either http or https
protocol=https
# Set the bind IP
bindIP=192.168.1.81
# Set the server url
serverURL=blog.local.kelsoncraft.net
# Set the port to run this with
# port=1313
port=8081

# ./hugo server -D --bind "$bindIP" --baseURL "$protocol"://"$bindIP" --port="$port" --disableFastRender
./hugo server -D \
 --bind "$bindIP" \
 --baseURL "$protocol"://"$serverURL" \
 --port="$port" \
 --disableFastRender \
 --appendPort=false