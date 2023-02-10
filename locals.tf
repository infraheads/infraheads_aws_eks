locals {
  vpc_id                            = var.create_vpc == true ? module.aws_vpc.vpc_id : var.vpc_id
  private_subnet_ids                = var.create_vpc == true ? module.aws_vpc.*.private_subnet_ids : var.private_subnet_ids
  public_subnet_ids                 = var.create_vpc == true ? module.aws_vpc.*.public_subnet_ids : var.public_subnet_ids
  control_plane_subnet_ids          = var.create_vpc == true ? module.aws_vpc.*.public_subnet_ids : var.public_subnet_ids
  eks_cluster_node_group_subnet_ids = var.create_vpc == true ? module.aws_vpc.*.public_subnet_ids : var.public_subnet_ids

}
