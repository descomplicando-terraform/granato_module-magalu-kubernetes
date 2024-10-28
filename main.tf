# Criando um cluster
resource "mgc_kubernetes_cluster" "cluster_with_nodepool" {
  name                 = var.cluster_name
  version              = var.kubernetes_version
  enabled_server_group = false
  description          = var.cluster_description
}

# Tempo de espera para o cluster ficar ativo
# Ajuste o tempo conforme necessário
resource "time_sleep" "wait_5_minutes" {
  depends_on      = [mgc_kubernetes_cluster.cluster_with_nodepool]
  create_duration = var.timer_duration
}

resource "random_string" "this" {
  length  = 8
  special = false
  upper   = false
  numeric = true # Atualizado para usar `numeric`
}

# Criando um nodepool
resource "mgc_kubernetes_nodepool" "nataliagranato" {
  depends_on   = [time_sleep.wait_5_minutes]
  name         = "${mgc_kubernetes_cluster.cluster_with_nodepool.name}-nodepool-${random_string.this.result}"
  cluster_id   = mgc_kubernetes_cluster.cluster_with_nodepool.id
  flavor_name  = var.node_pools.default.flavor
  replicas     = var.node_pools.default.min_replicas
  min_replicas = var.node_pools.default.min_replicas
  max_replicas = var.node_pools.default.max_replicas

  lifecycle {
    create_before_destroy = true
  }
}

# Timer para esperar o cluster ficar ativo
resource "time_sleep" "wait_for_cluster" {
  depends_on      = [mgc_kubernetes_cluster.cluster_with_nodepool]
  create_duration = "5m" # Ajuste o tempo conforme necessário
}

# Pegar o kubeconfig do cluster usando o output do cluster_id
data "mgc_kubernetes_cluster_kubeconfig" "cluster" {
  depends_on = [time_sleep.wait_for_cluster]
  cluster_id = mgc_kubernetes_cluster.cluster_with_nodepool.id
}

# Salvar o kubeconfig em um arquivo local
resource "local_file" "kubeconfig" {
  provider = local
  content  = data.mgc_kubernetes_cluster_kubeconfig.cluster.kubeconfig
  filename = "${path.module}/kubeconfig.yaml"
}
