# This works fine, generated with duck.ai from duckduckgo.

# Use a lightweight base image
# Switched to debian, the extended hugo requires glibc
FROM debian:trixie-slim

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl tar && \
    rm -rf /var/lib/apt/lists/*

# Set the Hugo version
ENV HUGO_VERSION=0.151.0

ENV HUGO_PORT=8080

# Install Hugo
# This gets the hugo version that is set above, the original version was last updated two years ago
# https://github.com/gohugoio/hugo/releases/download/v0.151.0/hugo_extended_0.151.0_linux-amd64.tar.gz
# https://hub.docker.com/r/klakegg/hugo/
RUN curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz && \
    tar -xvzf hugo.tar.gz && \
    mv hugo /usr/local/bin/ && \
    chmod +x /usr/local/bin/hugo && \
    rm hugo.tar.gz && \
    ls -l /usr/local/bin/hugo

# Set the working directory
WORKDIR /src

# Copy the entire Hugo project
COPY . .

# Start the Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port=${HUGO_PORT}", "--baseURL", "http://localhost:${HUGO_PORT}", "--watch"]