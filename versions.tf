terraform {
  required_providers {
    mgc = {
      source  = "magalucloud/mgc"
      version = "~> 0.27.0" # Permite atualizações dentro da versão 0.27.x
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.0" # Permite atualizações dentro da versão 2.5.x
    }
  }
}
