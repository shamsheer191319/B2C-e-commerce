output "rbac_role_name" {
  value = kubernetes_role.app_reader.metadata[0].name
}
