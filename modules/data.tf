data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_eks_cluster" "eks_cluster" {
  # this makes downstream resources wait for data plane to be ready
  name = time_sleep.dataplane.triggers["eks_cluster_id"]
}