workflow "New workflow" {
  on = "push"
  resolves = ["verify-production"]
}

action "Install" {
  uses = "actions/npm@master"
  args = "install"
}

action "Build" {
  needs = "Install"
  uses = "actions/npm@master"
  args = "build"
}

action "Lint" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "run lint"
}

action "Test" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "run test"
}

# Filter for master branch
action "Master" {
  needs = ["Test", "Lint"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Login" {
  needs = "Master"
  uses = "actions/heroku@master"
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "push-production" {
  uses = "actions/heroku@master"
  needs = "Login"
  args = ["container:push", "--app", "$HEROKU_APP", "web"]
  secrets = ["HEROKU_API_KEY"]
  env = {
    HEROKU_APP = "poc-nuxt-app-2"
  }
}

action "release-production" {
  uses = "actions/heroku@master"
  needs = "push-production"
  args = ["container:release", "--app", "$HEROKU_APP", "web"]
  secrets = ["HEROKU_API_KEY"]
  env = {
    HEROKU_APP = "poc-nuxt-app-2"
  }
}

action "verify-production" {
  needs = ["release-production"]
  uses = "actions/heroku@master"
  args = ["apps:info", "$HEROKU_APP"]
  secrets = ["HEROKU_API_KEY"]
  env = {
    HEROKU_APP = "poc-nuxt-app-2"
  }
}
