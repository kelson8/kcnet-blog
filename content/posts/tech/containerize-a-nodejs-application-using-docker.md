---
title: "Containerize a Nodejs Application Using Docker"
date: 2025-10-16T19:03:30-04:00
draft: false
toc: false
images:
tags:
  - tech
---


1. Create a Dockerfile:
```Dockerfile
FROM 22.20.0-alpine3.21
WORKDIR /app

COPY package.json .

RUN npm install

COPY . .
EXPOSE 3000

CMD ["npm", "run", "dev"]
```

2. Create a docker-compose file for this NodeJS project:
```yml

# Change network proxy to your desired Docker network.
services:
  node-app:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: node-app
    volumes:
      - ./data:/app/data
    networks:
       - "proxy"
    # If using traefik as a reverse proxy, this can be commented out or removed.
    ports:
       - 3000:3000
    restart: unless-stopped

networks:
  proxy:
    external: true
```

3. Create a data folder in the project, add nodejs app files, package.json, and anything else needed for NodeJS into here.

4. Create a `.dockerignore` file in the root of the project, add this content into it
```
.git
*Dockerfile*
*docker-compose*
node_modules
```

5. Lastly, run the docker compose project: `docker compose up -d`



### Credit for some of this guide
Credit for some of this guide goes to [Oluwatobi on Freecodecamp](https://www.freecodecamp.org/news/containerize-a-nodejs-application-using-docker/)

I have followed some of their guide, and found a dockerignore for nodejs.

Dockerignore for nodeJS: [NodeJS .dockerignore](https://github.com/BretFisher/node-docker-good-defaults/blob/main/.dockerignore)