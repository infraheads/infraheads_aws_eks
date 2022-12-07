resource "kubernetes_namespace_v1" "this" {
  count = var.argocd_apps_destination_namespace != "" ? 1 : 0 
  metadata {
    name = var.argocd_apps_destination_namespace
  }
}
resource "helm_release" "argocd-apps" {
  count            = var.enable_argocd_apps ? 1 : 0
  name             = var.argocd_apps_chart_name
  repository       = var.argocd_apps_chart_repo
  chart            = var.argocd_apps_chart_name
  version          = var.argocd_apps_chart_version
  namespace        = var.argocd_apps_namespace
  create_namespace = true

  values = var.argocd_apps_values != "" ? [ var.argocd_apps_values ] : [
    templatefile("${path.module}/values.yaml", {
      name            = var.argocd_apps_name
      app_namespace   = var.argocd_apps_namespace
      project         = var.argocd_apps_project
      repo_url        = var.argocd_apps_source_repo
      target_revision = var.argocd_apps_source_target_revision
      path            = var.argocd_apps_source_target_path
      recurse         = var.argocd_apps_source_target_recurse
      namespace       = var.argocd_apps_destination_namespace
      prune           = var.argocd_apps_prune
      self_heal       = var.argocd_apps_self_heal
    })
  ]
}