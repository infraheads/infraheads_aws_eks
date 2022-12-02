module "argocd" {
  count                = var.enable_argocd ? 1 : 0
  source               = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"
  argocd_helm_config   = var.argocd_helm_config
  argocd_applications  = var.argocd_applications
#   addon_config  = { for k, v in local.argocd_addon_config : k => v if v != null }
#   addon_context = local.addon_context
}

module "argo_workflows" {
  count                            = var.enable_argo_workflows ? 1 : 0
  source                           = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"
  argo_workflows_helm_config       = var.argo_workflows_helm_config
  argocd_manage_add_ons            = var.argocd_manage_add_ons
#   addon_context     = local.addon_context
}

module "external_dns" {
  source = "./external-dns"

  count = var.enable_external_dns ? 1 : 0

  external_dns_helm_config       = var.external_dns_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
  external_dns_irsa_policies     = var.external_dns_irsa_policies
#  addon_context                  = local.addon_context

  eks_cluster_domain             = var.eks_cluster_domain
  external_dns_private_zone      = var.external_dns_private_zone
  external_dns_route53_zone_arns = var.external_dns_route53_zone_arns
  create_route53_zone            = var.create_route53_zone
}

module "crossplane" {
  count               = var.enable_crossplane ? 1 : 0
  source                         = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"
  crossplane_helm_config         = var.crossplane_helm_config
  crossplane_aws_provider        = var.crossplane_aws_provider
  crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  crossplane_kubernetes_provider = var.crossplane_kubernetes_provider
  account_id                     = data.aws_caller_identity.current.account_id
  aws_partition                  = data.aws_partition.current.id
#   addon_context                  = local.addon_context
}