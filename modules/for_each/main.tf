resource "google_compute_network" "tf-net" {
  name                    = "tf-net"
  auto_create_subnetworks = true
}

resource "google_compute_instance" "tf-vm" {
  for_each = var.instances

  name         = each.value.name
  zone         = var.gcp-zone
  machine_type = each.value.machine_type
  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network    = google_compute_network.tf-net.self_link

    access_config {}
  }
}