resource "azuread_group" "platform_admins" {
  display_name     = local.platform_admin_group
  security_enabled = true
}

resource "azuread_group" "teams" {
  for_each = local.teams
  display_name     = each.value.aad_group_name
  security_enabled = true
}
