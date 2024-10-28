variable "cluster_name" {
  description = "Nome do Cluster"
  type        = string
  default     = "nataliagranato"
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes"
  type        = string
  default     = "v1.30.2"
}

variable "cluster_description" {
  description = "Descrição do Cluster"
  type        = string
  default     = "Um cluster de Kubernetes gerenciado pela Magalu Cloud."
}

variable "timer_duration" {
  description = "Duração do Timer"
  type        = string
  default     = "5m"
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
  default     = "br-se1"
}

variable "node_pools" {
  description = "Mapa de Node Pools"
  type = map(object({
    flavor       = string
    min_replicas = number
    max_replicas = number
  }))
  default = {
    default = {
      flavor       = "cloud-k8s.gp1.medium"
      min_replicas = 2
      max_replicas = 5
    }
  }
  validation {
    condition     = alltrue([for np in var.node_pools : np.min_replicas < np.max_replicas])
    error_message = "min_replicas deve ser menor que max_replicas para todos os pools de nós."
  }
}
