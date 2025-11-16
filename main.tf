resource "google_compute_network" "tf-net" {
  name                    = "tf-net"
  auto_create_subnetworks = true
}

module "database" {
  source         = "./modules/instance_module"
  instance-name  = var.instances.database.name
  machine-type   = var.instances.database.machine_type
  image          = var.instances.database.image
  gcp-zone       = var.gcp-zone
  gcp-username   = var.gcp-username
  gcp-network    = google_compute_network.tf-net.self_link
}

module "web-server" {
  source         = "./modules/instance_module"
  instance-name  = var.instances.web-server.name
  machine-type   = var.instances.web-server.machine_type
  image          = var.instances.web-server.image
  gcp-zone       = var.gcp-zone
  gcp-username   = var.gcp-username
  gcp-network    = google_compute_network.tf-net.self_link
}