FROM node:alpine
WORKDIR /usr/src
# Expose env host
# This is needed to ensure communication between containers
# between docker containers
ENV HOST 0.0.0.0

# Run server app
# Detect whether you have a yarn.lock already and if so
# just install deps listed on lock file
CMD yarn $([ -f yarn.lock ] && echo "install") && $(yarn bin)/nuxt dev