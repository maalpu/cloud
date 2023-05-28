variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parámetros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitorieo"
  type        = number
}

variable "ingress_port_list" {
  description = "Lista de puertos de ingress port"
  type        = list(number)
}

variable "access_key" {
  
}

variable "secret_key" {
  
}