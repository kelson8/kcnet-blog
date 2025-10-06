#!/bin/bash

#
 # This file is licensed under the GPLv3 License.
 # Copyright © 2025 kelson8
 #
 # [https://www.gnu.org/licenses/gpl-3.0.txt]
#

# Set this to either http or https
protocol=https
# Set the bind IP
# bindIP=192.168.1.81
# Set the server url
serverURL=ubuntu-server.lan
serverURLPublic=blog.local.kelsoncraft.net
publicURLEnabled=true
# Set the port to run this with
port=8081

# --buildDrafts can be added to include drafts in the build if needed.

# ./hugo.exe --baseURL "$protocol://$bindIP:$port"

# This basic check will either run the blog with "blog.local.kelsoncraft.net" for traefik, or "ubuntu-server.lan" without it.
if [ $publicURLEnabled = true ]; then
    ./hugo.exe --baseURL "$protocol://$serverURLPublic"
else
    ./hugo.exe --baseURL "$protocol://$serverURL:$port"
fi