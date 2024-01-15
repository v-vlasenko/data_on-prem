resource "scalr_module" "module" {
  environment_id  = scalr_environment.env_no_tag.id
  vcs_provider_id = scalr_vcs_provider.vcs.id
  vcs_repo {
    identifier = var.module_vcs-repo_identifier
    path       = var.module_vcs-repo_path
    tag_prefix = var.module_vcs-repo_tag-prefix
  }
}