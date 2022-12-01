# locals {
#   #-------------------------------------------------------
#   # VPC
#   #-------------------------------------------------------
#   azs      = data.aws_availability_zones.available.names
#   vpc_id   = var.vpc_id == "" ? module.vpc.vpc_id : var.vpc_id

#   # tags = {
#   #   Infraheads  = local.name
#   # }
# }