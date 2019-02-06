# poc-nuxt-app

> Poc app in nuxt

## Build Setup

``` bash
# install dependencies
$ yarn install

# serve with hot reload at localhost:3000
$ yarn run dev

# build for production and launch server
$ yarn run build
$ yarn start

# generate static project
$ yarn run generate
```

For detailed explanation on how things work, checkout [Nuxt.js docs](https://nuxtjs.org).

##

generate app with https://github.com/nuxt/create-nuxt-app

Just a commit to test action workflow

## docker :
build image in local :  
```bash
$ docker build . --build-arg API_URL=http://localhost:3001
```

Run in local:  
```bash
$ docker run -it -p 3000:3000 a4b23fd3e7df
```
