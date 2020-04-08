terraform {
  required_version = ">= 0.12.24"
}

provider "google" {
  version = "~> 3.15.0"
  project = "docker-266910"
  region  = "us-central1"
}

resource "google_container_cluster" "awesome-k8s-cluster" {
  name     = "awesome-k8s-cluster"
  location = "us-central1-c"

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "awesome-k8s-nodes" {
  name       = "awesome-k8s-node-pool"
  location   = "us-central1-c"
  cluster    = google_container_cluster.awesome-k8s-cluster.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    disk_size_gb = 20

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
