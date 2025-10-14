variable "enable_debug" {
  default = "true"
}
variable "route_name" {
  default = "default"
}
variable "route_address_prefix" {
  default = "0.0.0.0/0"
}
variable "route_next_hop_type" {
  default = "VirtualAppliance"
}
variable "route_next_hop_in_ip_address" {
  default = "10.10.1.1"
}

variable "additional_routes" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))

  default = []
}

variable "additional_subnets" {
  description = "Map of additional subnets to create, keyed by the subnet name."
  type = list(object({
    name              = string
    address_prefixes  = list(string)
    service_endpoints = optional(list(string))
    delegations = optional(map(object({
      service_name = string,
      actions      = list(string)
    })))
  }))
  default = []
}

variable "additional_routes_application_gateway" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))

  default = []
}