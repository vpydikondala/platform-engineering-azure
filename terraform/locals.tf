locals {
  platform_admin_group = "aks-platform-admins"

  teams = {
    team-a = { 
        aad_group_name = "aks-team-a-devs" 
        }
    team-b = { 
        aad_group_name = "aks-team-b-devs" 
        }
  }
}
