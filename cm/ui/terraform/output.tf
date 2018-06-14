#Ip for checking Pod is running
output "cluster_ip visible in cluster only" {
  value = "${kubernetes_service.nginx.spec.0.cluster_ip}"
}

#Nodeport accessable
output "NodePort" {
  value = "${kubernetes_service.nginx.spec.0.port.0.node_port}"
}

#Port mapping
output "target_port" {
  value = "${kubernetes_service.nginx.spec.0.port.0.target_port}"
}

#Protocol
output "Protocol" {
  value = "${kubernetes_service.nginx.spec.0.port.0.protocol}"
}
