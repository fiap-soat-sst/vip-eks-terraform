resource "kubernetes_namespace" "fiap_soat" {
  metadata {
    name = "vip-fiap-soat"
  }
}
