#---------------------------------------------------------------
# EKS Blueprints
#---------------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "${var.cluster_name}-vpc"
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 10)]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # Manage so we can name
  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${var.cluster_name}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${var.cluster_name}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${var.cluster_name}-default" }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
  }

  tags = local.tags
}

module "eks_blueprints" {
  source = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git"

  # EKS CLUSTER
  cluster_name    = var.cluster_name
  cluster_version = "1.23"

  vpc_id             = module.vpc.vpc_id # Enter VPC ID
  private_subnet_ids = module.vpc.private_subnets

  # EKS MANAGED NODE GROUPS
  managed_node_groups = {
    mg_5 = {
      node_group_name = "managed_ondemand" # Max node group length is 40 characters; including the node_group_name_prefix random id it's 63
      instance_types  = ["m5.large"]
      subnet_ids      = module.vpc.private_subnets

      desired_size = 5
      max_size     = 10
      min_size     = 3
    }
  }
  tags = local.tags
}

module "eks_blueprints_kubernetes_addons" {
  source = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id       = module.eks_blueprints.eks_cluster_id
  eks_cluster_endpoint = module.eks_blueprints.eks_cluster_endpoint
  eks_oidc_provider    = module.eks_blueprints.oidc_provider
  eks_cluster_version  = module.eks_blueprints.eks_cluster_version

  enable_argocd = var.enable_argocd
  # argocd_helm_config = {
  #   set_sensitive = [
  #     {
  #       name  = "configs.secret.argocdServerAdminPassword"
  #       value = var.argocd_admin_password
  #     }
  #   ]
  # }
  # U es dzevov petq e avelcnel sax kam skzbi hamar amenataracvac
  # blueprintsi submodulner@
  # enable_cert_manager = var.enable_cert_manager

}

module "infraheads_eks_modules_github_repo" {
  source = "modules/github_repo"
  count = var.create_github_repo? 1:0
  github_repo_name = var.cluster_name
  visibility = var.github_repo_visibility
  template_owner = var.github_template_repo_owner
  template_repo_name = var.github_template_repo_name

  
}
