module "addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  # ArgoCD
  enable_argocd       = var.enable_argocd
  argocd_helm_config  = var.argocd_helm_config
  argocd_applications = var.argocd_applications

  # ArgoCD workflow
  enable_argo_workflows      = var.enable_argo_workflows
  argo_workflows_helm_config = var.argo_workflows_helm_config
  argocd_manage_add_ons      = var.argocd_manage_add_ons
}

module "argocd_apps" {
  source = "./argocd_apps"
  count  = var.enable_argocd_apps ? 1 : 0
 
  argocd_apps_chart_repo    = var.argocd_apps_chart_repo
  argocd_apps_chart_name    = var.argocd_apps_chart_name
  argocd_apps_chart_version = var.argocd_apps_chart_version
  argocd_apps_namespace     = var.argocd_apps_namespace
 
  argocd_apps_name                   = var.argocd_apps_name
  argocd_apps_project                = var.argocd_apps_project
  argocd_apps_source_repo            = var.argocd_apps_source_repo
  argocd_apps_source_target_revision = var.argocd_apps_source_target_revision
  argocd_apps_source_target_path     = var.argocd_apps_source_target_path
  argocd_apps_source_target_recurse  = var.argocd_apps_source_target_recurse
  argocd_apps_destination_namespace  = var.argocd_apps_destination_namespace
  argocd_apps_prune                  = var.argocd_apps_prune
  argocd_apps_self_heal              = var.argocd_apps_self_heal
  argocd_apps_values                 = var.argocd_apps_values
}

module "external_dns" {
  source = "./external_dns"
  count  = var.enable_external_dns ? 1 : 0

  #   external_dns_helm_config       = var.external_dns_helm_config
  #   # argocd_manage_add_ons          = var.argocd_manage_add_ons
  #   external_dns_irsa_policies     = var.external_dns_irsa_policies

  #   eks_cluster_domain             = var.eks_cluster_domain
  #   external_dns_private_zone      = var.external_dns_private_zone
  #   external_dns_route53_zone_arns = var.external_dns_route53_zone_arns
  #   create_route53_zone            = var.create_route53_zone
}

module "github_repo" {
  source = "./github_repo"
  count  = var.enable_github_repo ? 1 : 0

  github_repo_name   = var.github_repo_name
  description        = var.github_description
  visibility         = var.github_visibility
  template_owner     = var.github_template_owner
  template_repo_name = var.github_template_repo_name
}
