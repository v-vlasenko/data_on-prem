resource "scalr_workspace" "ws_vcs" {
  name            = "workspace_VCS_${formatdate("DDMMYYYY", timestamp())}"
  environment_id  = scalr_environment.env_no_tag.id
  vcs_provider_id = scalr_vcs_provider.vcs.id

  working_directory = var.ws-vcs_workdir

  vcs_repo {
    identifier = var.ws-vcs_vcs-repo_identifier
    branch     = var.ws-vcs_vcs-repo_branch
  }

  tag_ids = [scalr_tag.auto_tag.id]
}

resource "scalr_workspace" "ws_cli" {
  name           = "workspace_CLI_${formatdate("DDMMYYYY", timestamp())}"
  environment_id = scalr_environment.env_no_tag.id
  agent_pool_id  = scalr_agent_pool.runs_agent_pool.id
}


resource "scalr_workspace_run_schedule" "run-schedule" {
  workspace_id   = scalr_workspace.ws_vcs.id
  apply_schedule = "0 * * * *"
}

resource "scalr_run_trigger" "run-trigger" {
  downstream_id = scalr_workspace.ws_vcs.id # run automatically triggered in this workspace once the run in the upstream workspace is applied
  upstream_id   = scalr_workspace.ws_cli.id
}