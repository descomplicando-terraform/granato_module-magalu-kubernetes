# Criando um cluster com um nodepool
resource "mgc_kubernetes_cluster" "cluster" {
  name                 = var.cluster_name
  version              = var.kubernetes_version
  enabled_server_group = var.enabled_server_group
  description          = var.cluster_description
}

# Criando um nodepool
resource "mgc_kubernetes_nodepool" "nataliagranato" {
  depends_on  = [mgc_kubernetes_cluster.cluster]
  name        = var.nodepool_name
  cluster_id  = mgc_kubernetes_cluster.cluster.id
  flavor_name = var.nodepool_flavor_name
  replicas    = var.nodepool_replicas
}

# Pegar o kubeconfig do cluster usando o output do cluster_id
data "mgc_kubernetes_cluster_kubeconfig" "cluster" {
  depends_on = [mgc_kubernetes_cluster.cluster]
  cluster_id = mgc_kubernetes_cluster.cluster.id
}

# Salvar o kubeconfig em um arquivo local
resource "local_file" "kubeconfig" {
  provider = local
  content  = data.mgc_kubernetes_cluster_kubeconfig.cluster.kubeconfig
  filename = "${path.module}/kubeconfig.yaml"
}
