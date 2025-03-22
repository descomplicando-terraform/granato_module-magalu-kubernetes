variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "mgc-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "v1.30.2"
}

variable "cluster_description" {
  description = "Cluster description"
  type        = string
  default     = "A Kubernetes cluster managed by Magalu Cloud."
}

variable "nodepool_name" {
  description = "Nodepool name"
  type        = string
  default     = "mgc-nodepool"
}

variable "nodepool_replicas" {
  description = "Number of nodepool replicas"
  type        = number
  default     = 1
}

variable "nodepool_flavor_name" {
  description = "Nodepool flavor"
  type        = string
  default     = "cloud-k8s.gp1.small"
}

variable "enabled_server_group" {
  description = "Habilitar ou desabilitar o server group no cluster"
  type        = bool
  default     = false
}
