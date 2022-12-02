<<<<<<< HEAD
=======
#---------------------------------------------------------------
# EKS Blueprints
#---------------------------------------------------------------
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
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

>>>>>>> parent of a1b144f (added github_repo and argocd_apps modules)
module "eks_blueprints" {
  source = "https://github.com/aws-ia/terraform-aws-eks-blueprints.git"

  # EKS CLUSTER
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                   = vpc.vpc_id # Enter VPC ID
  private_subnet_ids       = var.private_subnet_ids
  public_subnet_ids        = var.public_subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  cluster_timeouts = var.cluster_timeouts

  create_cluster_security_group           = var.create_cluster_security_group
  cluster_security_group_name             = var.cluster_security_group_name
  cluster_security_group_use_name_prefix  = var.cluster_security_group_use_name_prefix
  cluster_security_group_description      = var.cluster_security_group_description
  cluster_security_group_id               = var.cluster_security_group_id
  cluster_additional_security_group_ids   = var.cluster_additional_security_group_ids
  cluster_security_group_additional_rules = var.cluster_security_group_additional_rules
  cluster_security_group_tags             = var.cluster_security_group_tags

  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

  cluster_kms_key_arn                     = var.cluster_kms_key_arn
  cluster_kms_key_deletion_window_in_days = var.cluster_kms_key_deletion_window_in_days
  cluster_kms_key_additional_admin_arns   = var.cluster_kms_key_additional_admin_arns
  enable_cluster_encryption               = var.enable_cluster_encryption
  cluster_encryption_config               = var.cluster_encryption_config

<<<<<<< HEAD
  cluster_ip_family         = var.cluster_ip_family
  cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr
  cluster_service_ipv6_cidr = var.cluster_service_ipv6_cidr
=======
  enable_argocd = var.enable_argocd
  argocd_helm_config = {
    set_sensitive = [
      {
        name  = "configs.secret.argocdServerAdminPassword"
        value = var.argocd_admin_password
      }
    ]
  }
  # U es dzevov petq e avelcnel sax kam skzbi hamar amenataracvac
  # blueprintsi submodulner@
  enable_cert_manager = var.enable_cert_manager
>>>>>>> parent of a1b144f (added github_repo and argocd_apps modules)

  create_cloudwatch_log_group            = var.create_cloudwatch_log_group
  cluster_enabled_log_types              = var.cluster_enabled_log_types
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days
  cloudwatch_log_group_kms_key_id        = var.cloudwatch_log_group_kms_key_id

<<<<<<< HEAD
  create_iam_role               = var.create_iam_role
  iam_role_arn                  = var.iam_role_arn
  iam_role_name                 = var.iam_role_name
  iam_role_path                 = var.iam_role_path
  iam_role_description          = var.iam_role_description
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
  iam_role_additional_policies  = var.iam_role_additional_policies
  enable_irsa                   = var.enable_irsa
  openid_connect_audiences      = var.openid_connect_audiences
  custom_oidc_thumbprints       = var.custom_oidc_thumbprints
  cluster_identity_providers    = var.cluster_identity_providers

  managed_node_groups      = var.managed_node_groups
  self_managed_node_groups = var.self_managed_node_groups
  enable_windows_support   = var.enable_windows_support

  create_node_security_group           = var.create_node_security_group
  node_security_group_name             = var.node_security_group_name
  node_security_group_use_name_prefix  = var.node_security_group_use_name_prefix
  node_security_group_description      = var.node_security_group_description
  node_security_group_additional_rules = var.node_security_group_additional_rules
  node_security_group_tags             = var.node_security_group_tags
  worker_additional_security_group_ids = var.worker_additional_security_group_ids

  fargate_profiles = var.fargate_profiles

  map_accounts               = var.map_accounts
  map_roles                  = var.map_roles
  map_users                  = var.map_users
  aws_auth_additional_labels = var.aws_auth_additional_labels
  eks_readiness_timeout      = var.eks_readiness_timeout

  enable_emr_on_eks = var.enable_emr_on_eks
  emr_on_eks_teams  = var.emr_on_eks_teams

  application_teams = var.application_teams
  platform_teams    = var.platform_teams

  tags = var.tags
}
=======
#---------------------------------------------------------------
# Supporting Resources
#---------------------------------------------------------------

>>>>>>> parent of a1b144f (added github_repo and argocd_apps modules)
