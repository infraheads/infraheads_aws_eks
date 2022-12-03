resource "helm_release" "argocd-apps" {
  count            = var.enable_argocd_apps? 1 : 0
  name             = "argocd-apps"
  repository       = var.argocd_chart_repo
  chart            = var.argocd-apps_chart_name
  version          = var.argocd_apps_chart_version
  namespace        = var.argocd_namespace
  create_namespace = true

  values = [
    "${file("values.yaml")}"
  ]

}