terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
  backend "s3" {
    bucket                      = "granato-tf"
    key                         = "kubernetes-nataliagranato.tfstate"
    secret_key                  = var.mgc_obj_key_secret
    access_key                  = var.mgc_obj_key_id
    region                      = var.mgc_region
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    endpoints {
      s3 = "https://br-se1.magaluobjects.com/"
    }
  }
}
