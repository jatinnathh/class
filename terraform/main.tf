terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_manifest" "openfaas_function" {
  manifest = {
    apiVersion = "openfaas.com/v1"
    kind       = "Function"
    metadata = {
      name      = "env"
      namespace = "openfaas-fn"
    }
    spec = {
      name  = "env"
      image = "ghcr.io/openfaas/alpine:latest"
    }
  }
}