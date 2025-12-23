resource "azuread_group" "aks_platform_admins" {
  display_name     = "aks-platform-admins"
  security_enabled = true
}

resource "azuread_group" "aks_team_a_devs" {
  display_name     = "aks-team-a-devs"
  security_enabled = true
}

resource "azuread_group" "aks_team_b_devs" {
  display_name     = "aks-team-b-devs"
  security_enabled = true
}
