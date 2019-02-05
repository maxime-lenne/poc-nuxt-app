# Build step
FROM node:alpine as build-stage
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
RUN apk update && apk upgrade && apk add git

# Detect whether you have a yarn.lock already and if so
# just install deps listed on lock file
ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY yarn.lock /usr/src/app/
ONBUILD RUN yarn install
ONBUILD COPY . /usr/src/app/
ONBUILD RUN yarn build

# production step
# FROM node:alpine as production-stage

# Expose env host
# This is needed to ensure communication between containers
# between docker containers
ENV HOST 0.0.0.0
EXPOSE 3000

# Run server app
CMD [ "yarn", "start" ]
