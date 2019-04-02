workflow "Code Style" {
  resolves = ["Rubocop checks"]
  on = "push"
}

action "Rubocop checks" {
  uses = "gimenete/rubocop-action@1.0"
  secrets = ["GITHUB_TOKEN"]
}
