#Use this data source to lookup information about the current AWS partition in which Terraform is working.
data "aws_partition" "current" {}
#Use this data source to get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "time_sleep" "dataplane" {
  create_duration = "10s"

  triggers = {
    data_plane_wait_arn = var.data_plane_wait_arn # this waits for the data plane to be ready
    eks_cluster_id      = var.eks_cluster_id      # this ties it to downstream resources
  }
}

data "aws_eks_cluster" "eks_cluster" {
  # this makes downstream resources wait for data plane to be ready
  name = time_sleep.dataplane.triggers["eks_cluster_id"]
}
