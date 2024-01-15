resource "scalr_variable" "var_env" {
  key            = "TF_LOG"
  value          = "WARN"
  category       = "shell"
  environment_id = scalr_environment.env_no_tag.id
}
