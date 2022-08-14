gcloud services enable \
    multiclusteringress.googleapis.com \
    gkehub.googleapis.com \
    container.googleapis.com \
    --project=<<your_gcp_project_id>>


gcloud container clusters get-credentials <<kubernetes_cluster_name_output_from_gke_primary>> \
    --zone=europe-west4 \
    --project=<<your_gcp_project_id>>

gcloud container clusters get-credentials <<kubernetes_cluster_name_output_from_gke_secondary>> \
    --zone=europe-west2 \
    --project=<<your_gcp_project_id>>

kubectl config rename-context gke_<<your_gcp_project_id>>_europe-west4_<<kubernetes_cluster_name_output_from_gke_primary>> gke_pri
kubectl config rename-context gke_<<your_gcp_project_id>>_europe-west2_<<kubernetes_cluster_name_output_from_gke_secondary>> gke_sec


gcloud container fleet memberships register gke-pri-fleet \
    --gke-cluster europe-west4/<<kubernetes_cluster_name_output_from_gke_primary>> \
    --enable-workload-identity \
    --project=<<your_gcp_project_id>>

gcloud container fleet memberships register gke-sec-fleet \
    --gke-cluster europe-west2/<<kubernetes_cluster_name_output_from_gke_secondary>> \
    --enable-workload-identity \
    --project=<<your_gcp_project_id>>


gcloud container fleet ingress enable \
   --config-membership=gke-pri-fleet


