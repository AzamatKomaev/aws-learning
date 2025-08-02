variable "vpn_access_ami_id" {
  type    = string
  default = "ami-02003f9f0fde924ea"
}

variable "vpn_access_private_ip" {
  type = string 
  default = "172.31.17.56"
}

variable "socks5_proxy_username" {
  type = string 
  sensitive = true
}

variable "socks5_proxy_password" {
  type = string
  sensitive = true
}

variable "xray_clients" {
  type = list(object({
    id      = string
    email   = string
    alterId = number
  }))
}
