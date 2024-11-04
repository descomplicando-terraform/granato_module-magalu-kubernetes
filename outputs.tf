# Após a criação do recurso do cluster, o Terraform irá exibir o nome e o ID do cluster criado.
output "cluster_name" {
  value = mgc_kubernetes_cluster.cluster.name
}

output "cluster_id" {
  value = mgc_kubernetes_cluster.cluster.id
}
