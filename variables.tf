variable "cluster_name" {
  description = "Nome do Cluster"
  type        = string
  default     = "nataliagranato"
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "v1.28.5"
}

variable "cluster_description" {
  description = "Descrição do Cluster"
  type        = string
  default     = "Um cluster de Kubernetes gerenciado pela Magalu Cloud."
}

variable "nodepool_name" {
  description = "Nome do Nodepool"
  type        = string
  default     = "nataliagranato"
}

variable "nodepool_replicas" {
  description = "Número de Réplicas do Nodepool"
  type        = number
  default     = 1
}

variable "nodepool_flavor" {
  description = "Flavor do Nodepool"
  type        = string
  default     = "cloud-k8s.gp1.small"
}

variable "timer_duration" {
  description = "Duração do Timer"
  type        = string
  default     = "15m"
}
