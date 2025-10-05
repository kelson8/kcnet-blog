# This mostly works, generated with duck.ai from duckduckgo.
# It just needs to be fixed to display the posts at the proper url.

# Use a lightweight base image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache curl tar

# Set the Hugo version
ENV HUGO_VERSION=0.151.0

ENV HUGO_PORT=8080

# Install Hugo
RUN curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-amd64.tar.gz && \
    tar -xvzf hugo.tar.gz && \
    mv hugo /usr/local/bin/ && \
    chmod +x /usr/local/bin/hugo && \
    rm hugo.tar.gz

# Set the working directory
WORKDIR /src

# Copy the entire Hugo project
COPY . .

# Start the Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port=${HUGO_PORT}", "--baseURL", "http://localhost:${HUGO_PORT}", "--watch"]