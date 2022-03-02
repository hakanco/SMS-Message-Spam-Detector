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

resource "kubernetes_deployment" "spam-app" {
  metadata {
    name = "spam-app"
    labels = {
      App = "spam-app"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "spam-app"
      }
    }
    template {
      metadata {
        labels = {
          App = "spam-app"
        }
      }
      spec {
        container {
          image = "buildapp/spam-detector"
          name  = "spam-app"

          port {
            container_port = 9090
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "spam-app" {
  metadata {
    name = "spam-app"
  }
  spec {
    selector = {
      App = kubernetes_deployment.spam-app.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 30333
      port        = 9090
      target_port = 9090
    }

    type = "NodePort"
  }
}
