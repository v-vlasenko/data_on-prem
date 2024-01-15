resource "scalr_tag" "auto_tag" {
  name = "automatically_set:${formatdate("DDMMYYYY", timestamp())}"
}
