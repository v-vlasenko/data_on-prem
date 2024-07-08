resource "scalr_vcs_provider" "vcs" {
  name     = "vcs_${formatdate("DDMMYYYY", timestamp())}"
  vcs_type = var.base_vcs_type
  token    = var.base_vcs_token
}
