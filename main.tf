module "aws_vpc" {
  source = "./modules/aws_vpc"
  count  = var.create_vpc ? 1 : 0
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}

module "eks_blueprints" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.18.0"
  
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                   = local.vpc_id
  private_subnet_ids       = local.private_subnet_ids
  public_subnet_ids        = local.public_subnet_ids
  control_plane_subnet_ids = local.control_plane_subnet_ids

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

  cluster_ip_family         = var.cluster_ip_family
  cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr
  cluster_service_ipv6_cidr = var.cluster_service_ipv6_cidr

  create_cloudwatch_log_group            = var.create_cloudwatch_log_group
  cluster_enabled_log_types              = var.cluster_enabled_log_types
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days
  cloudwatch_log_group_kms_key_id        = var.cloudwatch_log_group_kms_key_id

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

