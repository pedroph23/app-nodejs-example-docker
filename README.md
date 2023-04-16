# How Create Docker Image and Publish in Docker Hub
Hello everyone ! <br>

This is a tuturial for create a Docker image and publish into Docker Hub. Check out setps below !

## 1 - Create Dockerfile 


``` dockerfile
FROM node:19

# WORKDIR is way for define a container work directory. Details: https://www.macoratti.net/20/09/docker_wordir1.htm
WORKDIR /app-nodejs-example-docker

# ARG is an "argument". It is an instruction that is load variables at build time.
ARG PORT_BUILD=3000
# ENV is an "enviroment". It is an instruction that is load variables into container. 
ENV PORT=${PORT_BUILD}

# EXPOSE is a commandn for expose ports 
EXPOSE ${PORT_BUILD}

# COPY is a command from copy local directory(host) into docker container. Example model: COPY source dest
COPY . .

# RUN is a commando for execute command into container docker container.
RUN npm install

# ENTRYPOIT is a command for when the container up, it will execute this command (npm start)
ENTRYPOINT npm start

```

## 2 - Create Image

- Model command example: ```docker build -t **<image-name>** **<path-to-dockerfile>**```

- Example command: 
```bash
docker build -t image_name:version .
```

```--t```: The flag ```--t``` is a Tag. You need to use it for create a name image. You can use too for another way flag, ```--tag```.

## 3 - Publish Your Own Docker Image

Before continues, you need create account on [Docker Hub]("https://hub.docker.com")!

- You need do Docker Hub login with Docker CLI: ``` docker login -u username ```. The nex step you will recive password field to fill.

- Model publish command example: ```docker push <username_docker_hub>/<image_name>:<version>```

- Example command: 
```bash
docker push username/image-name:1.0
```