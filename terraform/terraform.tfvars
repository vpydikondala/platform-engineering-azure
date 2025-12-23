location            = "uksouth"
resource_group = "rg-platform-engineering"
aks_name            = "aks-platform"
teams = {
  "team-a" = "team-a-namespace"
  "team-b" = "team-b-namespace"
}

dns_prefix = "platformaks"

k8s_version = "1.27.4"  # or the AKS version you want
