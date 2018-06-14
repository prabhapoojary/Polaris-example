variable "image" {
  description = "image for container"
  default = "php:latest"
}

variable "replicas" {
  description = "Set number of replicas for the pod"
  default = "4"
}

