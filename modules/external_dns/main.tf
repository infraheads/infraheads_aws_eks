resource "aws_route53_zone" "route53_zone" {
  count     = var.create_route53_zone ? 1 : 0
  name      = "${var.domain_name}"
}

module "eks_blueprints_kubernetes_addons_external_dns" {
  source = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  count                          = var.enable_external_dns ? 1 : 0

  external_dns_helm_config       = var.external_dns_helm_config
  manage_via_gitops              = var.manage_via_gitops
  external_dns_irsa_policies     = var.external_dns_irsa_policies

  eks_cluster_domain             = var.eks_cluster_domain
  external_dns_private_zone      = var.external_dns_private_zone
  external_dns_route53_zone_arns = var.external_dns_route53_zone_arns
}