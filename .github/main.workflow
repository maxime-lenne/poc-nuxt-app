workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Heroku"]
}

action "lint" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  runs = "npm run lint"
}

action "test" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  runs = "npm run test"
  needs = ["lint"]
}

action "GitHub Action for Heroku" {
  uses = "actions/heroku@9b6266f8ca2b26bc846af2547b2b11ad8a696223"
  needs = ["test"]
}
