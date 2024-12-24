# Creates 50 environments, each containing a module and a workspace. 
# All modules share the same VCS source but are created at the environment level.
# You can get rid of the null_resource.wait_for_module, but note that you'll get a fail during first apply and will have to trigger apply again after a few minutes (so all the modules are loaded)


resource "scalr_environment" "report_env" {
  count = 21
  name                            = "REPORTS_env_namespace_${count.index}"
  cost_estimation_enabled         = false
}



resource "scalr_workspace" "report_ws" {
  count = 21
  environment_id = scalr_environment.report_env[count.index].id

  name              = "REPORTS_module_ws_${count.index}"
  module_version_id = data.scalr_module_version.report_get_modver_id[count.index].id
}

variable "token" {
  description = "Scalr token with admin permissions. You may use the one from the PCFG."
  sensitive = true
}
