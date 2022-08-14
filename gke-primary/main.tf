terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  project = var.project_id
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke-primary"
  location = var.region

  enable_autopilot = true
  release_channel {
    channel = "STABLE"
  }
  node_locations  = ["europe-west4-a", "europe-west4-b"]

  network    = var.vpc_name
  subnetwork = var.subnet_name
}
