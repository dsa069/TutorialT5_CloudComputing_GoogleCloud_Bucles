variable "gcp-username" {
  description = "GCP user name"
}

variable "gcp-project" {
  description = "GCP project"
}

variable "instances" {
  description = "Number of instances to create"
  type = map(object({
    name         = string,
    machine_type = string,
    image        = string
  }))
}

variable "gcp-zone" {
  description = "zona"
}