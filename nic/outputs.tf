output "external_name" {
    value = try(data.kubernetes_service_v1.nginx-service.status.0.load_balancer.0.ingress.0.hostname, null)
}
output "external_port" {
    value = try(data.kubernetes_service_v1.nginx-service.spec.0.port.0.port, null)
}
/*
output "external_name" {
    value = try(data.kubernetes_service_v1.nginx-service.status.load_balancer.ingress.0.hostname, "")
}
output "external_port" {
    value = try(data.kubernetes_service_v1.nginx-service[0].spec.0.port.0.port, "")
}
*/
output "origin_source" {
    value = "nic"
}
output "nic_deployment_name" {
    value = try (helm_release.nginx-plus-ingress[0].name, helm_release.nginx-plus-ingresslink[0].name)
    sensitive = true
}