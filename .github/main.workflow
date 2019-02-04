workflow "New workflow" {
  on = "push"
  resolves = ["Release"]
}

action "Build" {
  uses = "actions/npm@master"
  args = "install"
}

action "Lint" {
  needs = "Build"
  uses = "actions/npm@master"
  args = "run lint"
}

action "Test" {
  needs = "Lint"
  uses = "actions/npm@master"
  args = "run test"
}

# Filter for master branch
action "Master" {
  needs = "Test"
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Login" {
  needs = "Master"
  uses = "actions/heroku@master"
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "Push" {
  uses = "actions/heroku@master"
  needs = "Login"
  args = "container:push -a poc-nuxt-app-2 web"
  secrets = ["HEROKU_API_KEY"]
}

action "Release" {
  uses = "actions/heroku@master"
  needs = "Push"
  args = "container:release -a poc-nuxt-app-2 web"
  secrets = ["HEROKU_API_KEY"]
}
