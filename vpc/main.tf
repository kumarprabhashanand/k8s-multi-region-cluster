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

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "primary_subnet" {
  name          = "${var.project_id}-pri-subnet"
  region        = var.pri_region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/16"
}

resource "google_compute_subnetwork" "secondary_subnet" {
  name          = "${var.project_id}-sec-subnet"
  region        = var.sec_region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.11.0.0/16"
}