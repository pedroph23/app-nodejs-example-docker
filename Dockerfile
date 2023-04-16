FROM node:19

# WORKDIR is way for define a container work directory. Details: https://www.macoratti.net/20/09/docker_wordir1.htm
WORKDIR /app-nodejs-example-docker

# ARG is an "argument". It is an instruction that is load variables at build time.
ARG PORT_BUILD=3000

# EXPOSE is a command for expose ports 
EXPOSE ${PORT_BUILD}

# ENV is an "enviroment". It is an instruction that is load variables into container. 
ENV PORT=${PORT_BUILD}

# COPY is a command from copy local directory(host) into docker container. Example model: COPY source dest
COPY . .

# RUN is a commando for execute command into container docker container.
RUN npm install

# ENTRYPOIT is a command for when the container up, it will execute this command (npm start)
ENTRYPOINT npm start