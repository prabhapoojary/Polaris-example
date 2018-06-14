#Terraform script for polaries-ui app



#Section for Replication controller

resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels {
      App = "ScalableNginxExample"
    }
  }
  spec {
    replicas = "${var.replicas}"
    selector {
      App = "ScalableNginxExample"
    }
    template {
      container {
        image = "${var.image}"
        name  = "example"

        port {
          container_port = 80
        }

      }
    }
  }
}

#Loadbalancing via services
resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }
  spec {
    selector {
      App = "${kubernetes_replication_controller.nginx.metadata.0.labels.App}"
    }
    port {
      port = 80
      target_port = 80
    }
    type = "NodePort"
  }
}

