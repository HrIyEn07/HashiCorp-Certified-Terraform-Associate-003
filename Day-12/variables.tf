
variable "resource_group_name" {
  description = "Resource group name"
  type = string
  default = "devopsrg01"
}

variable "location" {
  description = "Resource group location"
  type = string
  default = "Centralus"
  validation {
    condition = var.location == "eastus" || var.location == "Centralus"
    #condition     = contains(["eastus", "Centralus"], var.location)
    error_message = "Resource group must be created only in Eastus and Centralus."
  }
}

variable "storage_account_name" {
  description = "Storage account name"
    type = string
    default = "storageaccountdev10"
}

variable "common-tags" {
  description = "Common tags"
  type = map(string)
  default = {
    Owner = "Hriyen"
    Dept  = "IT"
    Deployment = "terraform"
    environment = "Staging "
  }
}