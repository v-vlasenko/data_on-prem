# Creates 50 environments, each containing a module and a workspace. 
# All modules share the same VCS source but are created at the environment level.
# You can get rid of the null_resource.wait_for_module, but note that you'll get a fail during first apply and will have to trigger apply again after a few minutes (so all the modules are loaded)


resource "scalr_environment" "report_env" {
  count = 50
  name                            = "REPORTS_env_namespace_${count.index}"
  account_id                      = var.acc_id
  cost_estimation_enabled         = false
}

resource "scalr_module" "report_module" {
  count = 50
  account_id      = var.acc_id
  environment_id  = scalr_environment.report_env[count.index].id
  vcs_provider_id = scalr_vcs_provider.vcs
  vcs_repo {
    identifier = var.module_vcs-repo_identifier
    path       = var.module_vcs-repo_path
    tag_prefix = var.module_vcs-repo_tag-prefix
  }
}

resource "null_resource" "wait_for_module" {
  count = 50
  depends_on = [ scalr_module.report_module ]
  provisioner "local-exec" {
    command = "sed 's/url = \"your_url_here\"/url = \"https://$${SCALR_HOSTNAME}/api/iacp/v3/modules/${scalr_module.report_module[count.index].id}\"/; s/bearer_token = \"your_bearer_token_here\"/bearer_token = \"${var.token}\"/' wait_for_module.py > wait_for_module_${count.index}.py && "
  }
}

data "scalr_module_version" "report_get_modver_id" {
  count   = 50
  source  = "${scalr_environment.report_env[count.index].id}/${scalr_module.report_module[count.index].name}/${scalr_module.report_module[count.index].module_provider}"
  version = var.module_existing_version_number
  depends_on = [ null_resource.wait_for_module]
}

resource "scalr_workspace" "report_ws" {
  count = 50
  environment_id = scalr_environment.report_env[count.index].id

  name              = "REPORTS_module_ws_${count.index}"
  module_version_id = data.scalr_module_version.report_get_modver_id[count.index].id
}
