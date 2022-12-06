resource "helm_release" "argocd-apps" {
  # count            = var.enable_argocd_apps? 1 : 0
  name             = "argocd-apps"
  repository       = var.argocd_apps_chart_repo
  chart            = var.argocd_apps_chart_name
  version          = var.argocd_apps_chart_version
  namespace        = var.argocd_apps_namespace
  create_namespace = true

  values = var.argocd_apps_values

  set {
    name  = "applications[0].source.repoURL"
    value = var.argocd_apps_repo_url
  }
  set {
    name  = "applications[0].source.path"
    value = var.argocd_apps_repo_path
  }
  set {
    name  = "applications[0].destination.namespace"
    value = var.project_namespace
  }


}
