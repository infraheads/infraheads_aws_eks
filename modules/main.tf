module "addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  # ArgoCD
  enable_argocd       = var.enable_argocd
  argocd_helm_config  = var.argocd_helm_config
  argocd_applications = var.argocd_applications

  #  # ArgoCD workflow
  #  enable_argo_workflows      = var.enable_argo_workflows
  #  argo_workflows_helm_config = var.argo_workflows_helm_config
  #  argocd_manage_add_ons      = var.argocd_manage_add_ons
  #
  #  # ArgoCD rollouts
  #  enable_argo_rollouts       = var.enable_argo_rollouts
  #  helm_config                = var.argo_rollouts_helm_config
  #  manage_via_gitops          = var.argocd_manage_add_ons
  #  addon_context              = local.addon_context
  #
  #  # Grafana
  #  enable_grafana             = var.enable_grafana
  #  grafana_helm_config        = var.grafana_helm_config
  #  grafana_irsa_policies      = var.grafana_irsa_policies
  #
  #  #Ingress Nginx
  #  enable_ingress_nginx       = var.enable_ingress_nginx
  #  ingress_nginx_helm_config  = var.ingress_nginx_helm_config
  #
  #  #Crossplane
  #  enable_crossplane              = var.enable_crossplane
  #  crossplane_helm_config         = var.crossplane_helm_config
  #  crossplane_aws_provider        = var.crossplane_aws_provider
  #  crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  #  crossplane_kubernetes_provider = var.crossplane_kubernetes_provider
}

module "argocd_apps" {
  source = "./argocd-apps"
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

  depends_on = [
    module.addons
  ]
}

module "external_dns" {
  source = "./external-dns"
  count  = var.enable_external_dns ? 1 : 0

  helm_config         = var.external_dns_helm_config
  manage_via_gitops   = var.argocd_manage_add_ons
  irsa_policies       = var.external_dns_irsa_policies
  domain_name         = var.eks_cluster_domain_name
  private_zone        = var.external_dns_private_zone
  route53_zone_arns   = var.external_dns_route53_zone_arns
  create_route53_zone = var.create_route53_zone
  addon_context       = local.addon_context
}

module "github_repo" {
  source = "./github-repo"
  count  = var.enable_github_repo ? 1 : 0

  github_repo_name   = var.github_repo_name
  description        = var.github_description
  visibility         = var.github_visibility
  template_owner     = var.github_template_owner
  template_repo_name = var.github_template_repo_name
}

module "cert_manager" {
  count                             = var.enable_cert_manager ? 1 : 0
  source                            = "./cert-manager"
  helm_config                       = var.cert_manager_helm_config
  manage_via_gitops                 = var.argocd_manage_add_ons
  irsa_policies                     = var.cert_manager_irsa_policies
  addon_context                     = local.addon_context
  domain_names                      = var.cert_manager_domain_names
  install_acme_issuers              = var.cert_manager_install_acme_issuers
  kubernetes_svc_image_pull_secrets = var.cert_manager_kubernetes_svc_image_pull_secrets
  cluster_issuer_name               = var.cert_manager_cluster_issuer_name
  email                             = var.cert_manager_email
  external_account_keyID            = var.cert_manager_external_account_keyID
  external_account_secret_key       = var.cert_manager_external_account_secret_key
  preferred_chain                   = var.cert_manager_preferred_chain
  acme_server_url                   = var.cert_manager_acme_server_url
  dns_region                        = var.cert_manager_dns_region
  common_name                       = var.cert_manager_certificate_common_name
  is_ca                             = var.cert_manager_certificate_is_ca
  hosted_zone_id                    = var.cert_manager_hosted_zone_id
}
