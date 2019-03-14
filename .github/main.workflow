workflow "Integration" {
  on = "push"
  resolves = ["GitHub Action for npm-1"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "GitHub Action for npm-1" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["GitHub Action for npm"]
  args = "test"
}

workflow "Delivery" {
  on = "deployment"
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  resolves = ["GitHub Action for npm-5"]
}

action "GitHub Action for npm-2" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "build"
}

action "GitHub Action for npm-3" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["GitHub Action for npm-2"]
  args = "test"
}

action "GitHub Action for npm-4" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["GitHub Action for npm-3"]
  args = "tag"
}

action "GitHub Action for npm-5" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["GitHub Action for npm-4"]
  args = "publish --access public"
  secrets = ["NPM_AUTH_TOKEN"]
}
