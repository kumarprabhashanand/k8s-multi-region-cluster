output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "primary_subnet_name" {
  value = google_compute_subnetwork.primary_subnet.name
}

output "secondary_subnet_name" {
  value = google_compute_subnetwork.secondary_subnet.name
}