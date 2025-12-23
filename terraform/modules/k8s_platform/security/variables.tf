variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
