# Módulo Terraform para criação de clusters Kubernetes na Magalu Cloud

Um módulo Terraform para a criação de clusters Kubernetes na Magalu Cloud.

[![Verificar código Terraform com tfsec](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes/actions/workflows/tfscan.yml/badge.svg)](https://github.com/descomplicando-terraform/granato_module-magalu-kubernetes/actions/workflows/tfscan.yml)
<!-- BEGIN_TF_DOCS -->

```mermaid
flowchart TD;
 subgraph Terraform
  data.mgc_kubernetes_cluster_kubeconfig.cluster["data.mgc_kubernetes_cluster_kubeconfig.cluster"]
  local_file.kubeconfig["local_file.kubeconfig"]
  mgc_kubernetes_cluster.cluster_with_nodepool["mgc_kubernetes_cluster.cluster_with_nodepool"]
  mgc_kubernetes_nodepool.gp1_small["mgc_kubernetes_nodepool.gp1_small"]
  time_sleep.wait_15_minutes["time_sleep.wait_15_minutes"]
  time_sleep.wait_for_cluster["time_sleep.wait_for_cluster"]
  data.mgc_kubernetes_cluster_kubeconfig.cluster --> time_sleep.wait_for_cluster
  local_file.kubeconfig --> data.mgc_kubernetes_cluster_kubeconfig.cluster
  mgc_kubernetes_nodepool.gp1_small --> time_sleep.wait_15_minutes
  time_sleep.wait_15_minutes --> mgc_kubernetes_cluster.cluster_with_nodepool
  time_sleep.wait_for_cluster --> mgc_kubernetes_cluster.cluster_with_nodepool
 end
```

## Como Usar

1. Adicione o módulo ao seu arquivo `main.tf`:

   ```hcl
   module "magalu_kubernetes_cluster" {
     source  = "github.com/descomplicando-terraform/granato_module-magalu-kubernetes?ref=v1.0.0"
     
     cluster_name        = "seu_cluster_name"
     cluster_description = "descrição do seu cluster"
     kubernetes_version  = "v1.28.5"
     nodepool_name       = "seu_nodepool_name"
     nodepool_flavor     = "cloud-k8s.gp1.small"
     nodepool_replicas   = 1
     timer_duration      = "15m"
   }
   ```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_mgc"></a> [mgc](#provider\_mgc) | 0.21.1 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/file) | resource |
| [mgc_kubernetes_cluster.cluster_with_nodepool](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/resources/kubernetes_cluster) | resource |
| [mgc_kubernetes_nodepool.gp1_small](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/resources/kubernetes_nodepool) | resource |
| [time_sleep.wait_15_minutes](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_for_cluster](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [mgc_kubernetes_cluster_kubeconfig.cluster](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/data-sources/kubernetes_cluster_kubeconfig) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | Descrição do Cluster | `string` | `"Um cluster de Kubernetes gerenciado pela Magalu Cloud."` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster | `string` | `"nataliagranato"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Versão do Kubernetes | `string` | `"v1.28.5"` | no |
| <a name="input_nodepool_flavor"></a> [nodepool\_flavor](#input\_nodepool\_flavor) | Flavor do Nodepool | `string` | `"cloud-k8s.gp1.small"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nome do Nodepool | `string` | `"nataliagranato"` | no |
| <a name="input_nodepool_replicas"></a> [nodepool\_replicas](#input\_nodepool\_replicas) | Número de Réplicas do Nodepool | `number` | `1` | no |
| <a name="input_timer_duration"></a> [timer\_duration](#input\_timer\_duration) | Duração do Timer | `string` | `"15m"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END_TF_DOCS -->
