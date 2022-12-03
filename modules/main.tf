module "argocd" {
  source                         = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"
  
  # ArgoCD
  enable_argocd                  = var.enable_argocd
  argocd_helm_config             = var.argocd_helm_config
  argocd_applications            = var.argocd_applications
  
  # ArgoCD workflow
  enable_argo_workflows          = var.enable_argo_workflows
  argo_workflows_helm_config     = var.argo_workflows_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
  
  # Crossplane
  enable_crossplane              = var.enable_crossplane
  crossplane_helm_config         = var.crossplane_helm_config
  crossplane_aws_provider        = var.crossplane_aws_provider
  crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  crossplane_kubernetes_provider = var.crossplane_kubernetes_provider
  account_id                     = data.aws_caller_identity.current.account_id
  aws_partition                  = data.aws_partition.current.id
}

module "external_dns" {
  source = "./external_dns"
  count = var.enable_external_dns ? 1 : 0

  external_dns_helm_config       = var.external_dns_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
  external_dns_irsa_policies     = var.external_dns_irsa_policies

  eks_cluster_domain             = var.eks_cluster_domain
  external_dns_private_zone      = var.external_dns_private_zone
  external_dns_route53_zone_arns = var.external_dns_route53_zone_arns
  create_route53_zone            = var.create_route53_zone
}

module "github_repo" {
  source = "./github_repo"
  count = var.enable_github_repo ? 1 : 0

  github_repo_name   = var.github_repo_name
  description        = var.github_description
  visibility         = var.github_visibility
  template_owner     = var.github_template_owner
  template_repo_name = var.github_template_repo_name
}

module "argocd_apps" {
  source = "./argocd_apps"
  count = var.enable_argocd_apps ? 1 : 0

  argocd_apps_chart_repo    = var.argocd_apps_chart_repo
  argocd_apps_chart_name    = var.argocd_apps_chart_name
  argocd_apps_chart_version = var.argocd_apps_chart_version
  argocd_apps_namespace     = var.argocd_apps_namespace
}
