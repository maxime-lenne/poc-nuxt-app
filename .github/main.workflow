workflow "New workflow" {
  on = "push"
  resolves = ["test"]
}

action "lint" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  runs = "lint"
}

action "test" {
  uses = "actions/npm@3c8332795d5443adc712d30fa147db61fd520b5a"
  runs = "test"
  needs = ["lint"]
}
