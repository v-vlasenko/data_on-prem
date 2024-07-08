resource "scalr_agent_pool" "runs_agent_pool" {
  name = "agent_pool_${formatdate("DDMMYYYY", timestamp())}"
}

resource "scalr_agent_pool_token" "ap-token" {
  description   = "Automatically created/updated at: ${timestamp()}"
  agent_pool_id = scalr_agent_pool.runs_agent_pool.id
}
