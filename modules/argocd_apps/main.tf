resource "helm_release" "argocd-apps" {
  count            = var.enable_argocd_apps? 1 : 0
  name             = "argo-apps"
  repository       = var.argocd_chart_repo
  chart            = "argocd-apps"
  version          = var.argocd_apps_chart_version
  namespace        = var.argocd_namespace
  create_namespace = true

  values = [
    "${file("argo-apps.yaml")}"
  ]

}