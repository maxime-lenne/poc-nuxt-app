FROM node:alpine
WORKDIR /usr/src
# Expose env host
# This is needed to ensure communication between containers
# between docker containers
ENV HOST 0.0.0.0
ENV NODE_ENV=production
EXPOSE 3000

RUN mkdir -p /app
COPY . /app
WORKDIR /app

# Run server app
# Detect whether you have a yarn.lock already and if so
# just install deps listed on lock file
RUN yarn install
RUN yarn build
RUN yarn start
