terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.21.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4"
    }
  }
}
