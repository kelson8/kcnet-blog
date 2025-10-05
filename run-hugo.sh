#!/bin/bash

# TODO Test this script on Linux later
# This is a recreation of the run-hugo.bat Windows batch file.
# This is a basic script to run hugo for Linux with a specific protocol, ip, and port.

# Set this to either http or https
protocol=http
# Set the bind IP
bindIP=192.168.1.109
# Set the port to run this with
# port=1313
port=8081

./hugo server -D --bind "$bindIP" --baseURL "$protocol"://"$bindIP" --port="$port" --disableFastRender