## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.5.0 |
| <a name="requirement_mgc"></a> [mgc](#requirement\_mgc) | ~> 0.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2.5.0 |
| <a name="provider_mgc"></a> [mgc](#provider\_mgc) | ~> 0.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.kubeconfig](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [mgc_kubernetes_cluster.cluster](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/resources/kubernetes_cluster) | resource |
| [mgc_kubernetes_nodepool.nataliagranato](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/resources/kubernetes_nodepool) | resource |
| [mgc_kubernetes_cluster_kubeconfig.cluster](https://registry.terraform.io/providers/magalucloud/mgc/latest/docs/data-sources/kubernetes_cluster_kubeconfig) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | Cluster description | `string` | `"A Kubernetes cluster managed by Magalu Cloud."` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster name | `string` | `"mgc-cluster"` | no |
| <a name="input_enabled_server_group"></a> [enabled\_server\_group](#input\_enabled\_server\_group) | Habilitar ou desabilitar o server group no cluster | `bool` | `false` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | `"v1.30.2"` | no |
| <a name="input_nodepool_flavor_name"></a> [nodepool\_flavor\_name](#input\_nodepool\_flavor\_name) | Nodepool flavor | `string` | `"cloud-k8s.gp1.small"` | no |
| <a name="input_nodepool_name"></a> [nodepool\_name](#input\_nodepool\_name) | Nodepool name | `string` | `"mgc-nodepool"` | no |
| <a name="input_nodepool_replicas"></a> [nodepool\_replicas](#input\_nodepool\_replicas) | Number of nodepool replicas | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Após a criação do recurso do cluster, o Terraform irá exibir o nome e o ID do cluster criado. |
