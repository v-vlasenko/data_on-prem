resource "scalr_provider_configuration" "pcfg_gcp" {
  name         = "provider_config_GCP_${formatdate("DDMMYYYY", timestamp())}"
  environments = [scalr_environment.env_no_tag.id]
  google {
    credentials = var.pcfg_gcp_credentials
  }
}

resource "scalr_provider_configuration_default" "pcfg-default" {
  environment_id            = scalr_environment.env_no_tag.id
  provider_configuration_id = scalr_provider_configuration.pcfg_gcp.id
}