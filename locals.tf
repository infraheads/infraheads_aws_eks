locals {
  vpc_id                            = var.create_vpc == true ? module.vpc.0.vpc_id : var.vpc_id
  private_subnet_ids                = var.create_vpc == true ? [for i in module.vpc.0.private_subnets : i] : var.private_subnet_ids
  public_subnet_ids                 = var.create_vpc == true ? [for i in module.vpc.0.public_subnets : i] : var.public_subnet_ids
  control_plane_subnet_ids          = var.create_vpc == true ? [for i in module.vpc.0.public_subnets : i] : var.public_subnet_ids
  eks_cluster_node_group_subnet_ids = var.create_vpc == true ? [for i in module.vpc.0.public_subnets : i] : var.public_subnet_ids

}