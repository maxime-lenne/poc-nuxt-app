FROM node:alpine
WORKDIR /usr/src
# Expose env host
# This is needed to ensure communication between containers
# between docker containers
ENV HOST 0.0.0.0

RUN mkdir -p /app
COPY . /app
WORKDIR /app

# Run server app
# Detect whether you have a yarn.lock already and if so
# just install deps listed on lock file
CMD yarn install
CMD yarn build
CMD yarn start
