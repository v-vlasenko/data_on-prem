resource "scalr_environment" "env_tag" {
  name                    = "env_tag_${formatdate("DDMMYYYY", timestamp())}"
  cost_estimation_enabled = true
  tag_ids                 = [scalr_tag.auto_tag.id]
}

resource "scalr_environment" "env_no_tag" {
  name                    = "env_no_tag_${formatdate("DDMMYYYY", timestamp())}"
  cost_estimation_enabled = false
}