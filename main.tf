# Criando um cluster
resource "mgc_kubernetes_cluster" "cluster_with_nodepool" {
  name                 = var.cluster_name
  version              = var.kubernetes_version
  enabled_server_group = false
  description          = var.cluster_description
}

# Tempo de espera para o cluster ficar ativo
# Ajuste o tempo conforme necessário
resource "time_sleep" "wait_15_minutes" {
  depends_on      = [mgc_kubernetes_cluster.cluster_with_nodepool]
  create_duration = var.timer_duration
}

# Criando um nodepool
resource "mgc_kubernetes_nodepool" "gp1_small" {
  depends_on  = [time_sleep.wait_15_minutes] # Wait timer
  name        = var.nodepool_name
  cluster_id  = mgc_kubernetes_cluster.cluster_with_nodepool.id
  flavor_name = var.nodepool_flavor_name
  replicas    = var.nodepool_replicas
  # auto_scale attribute is not supported
}

# Timer para esperar o cluster ficar ativo
resource "time_sleep" "wait_for_cluster" {
  depends_on      = [mgc_kubernetes_cluster.cluster_with_nodepool]
  create_duration = "10m" # Ajuste o tempo conforme necessário
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
