resource "google_compute_instance" "tf-vm" {
  name         = var.instance-name
  zone         = var.gcp-zone
  machine_type = var.machine-type
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata = {
    ssh-keys = "${var.gcp-username}:${file("~/.ssh/clave-gc.pub")}"
  }

  network_interface {
    network    = var.gcp-network

    access_config {}
  }
}