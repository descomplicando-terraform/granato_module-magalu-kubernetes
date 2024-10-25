variable "cluster_name" {
  description = "Nome do Cluster"
  type        = string
  default     = "nataliagranato"
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "v1.28.11"
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

variable "mgc_api_key" {
  type        = string
  description = "Chave da Magalu Cloud"
}

variable "mgc_obj_key_id" {
  type        = string
  description = "ID da Chave do Object Storage"
}

variable "mgc_obj_key_secret" {
  type        = string
  description = "Secret da Chave do Object Storage"
}

variable "mgc_region" {
  type        = string
  description = "Região da Magalu Cloud"
}

variable "nodepool_flavor_name" {
  description = "The flavor name for the Kubernetes nodepool"
  type        = string
}
