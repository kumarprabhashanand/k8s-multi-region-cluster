output "kubernetes_cluster_name" {
  value       = google_container_cluster.secondary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.secondary.endpoint
  description = "GKE Cluster Host"
}