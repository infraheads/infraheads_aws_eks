#-----------------AWS Managed EKS Add-ons----------------------
module "aws_vpc_cni" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_vpc_cni = var.enable_amazon_eks_vpc_cni
  enable_ipv6               = var.enable_ipv6
  amazon_eks_vpc_cni_config = var.amazon_eks_vpc_cni_config
}

module "aws_coredns" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_coredns                           = var.enable_amazon_eks_coredns
  enable_self_managed_coredns                         = var.enable_self_managed_coredns
  amazon_eks_coredns_config                           = var.amazon_eks_coredns_config
  self_managed_coredns_helm_config                    = var.self_managed_coredns_helm_config
  enable_coredns_cluster_proportional_autoscaler      = var.enable_coredns_cluster_proportional_autoscaler
  coredns_cluster_proportional_autoscaler_helm_config = var.coredns_cluster_proportional_autoscaler_helm_config
  remove_default_coredns_deployment                   = var.remove_default_coredns_deployment
}

module "aws_kube_proxy" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_kube_proxy = var.enable_amazon_eks_kube_proxy
  amazon_eks_kube_proxy_config = var.amazon_eks_kube_proxy_config
}

module "aws_ebs_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_aws_ebs_csi_driver        = var.enable_amazon_eks_aws_ebs_csi_driver
  enable_self_managed_aws_ebs_csi_driver      = var.enable_self_managed_aws_ebs_csi_driver
  amazon_eks_aws_ebs_csi_driver_config        = var.amazon_eks_aws_ebs_csi_driver_config
  self_managed_aws_ebs_csi_driver_helm_config = var.self_managed_aws_ebs_csi_driver_helm_config
}

#-----------------Kubernetes Add-ons----------------------
module "agones" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_agones      = var.enable_agones
  agones_helm_config = var.agones_helm_config
}

module "airflow" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_airflow      = var.enable_airflow
  airflow_helm_config = var.airflow_helm_config
}

module "argocd" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_argocd       = var.enable_argocd
  argocd_helm_config  = var.argocd_helm_config
  argocd_applications = var.argocd_applications
}

module "argocd_rollouts" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_argo_rollouts      = var.enable_argo_rollouts
  argo_rollouts_helm_config = var.argo_rollouts_helm_config
  argocd_manage_add_ons     = var.argocd_manage_add_ons
}

module "argocd_workflows" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_argo_workflows      = var.enable_argo_workflows
  argo_workflows_helm_config = var.argo_workflows_helm_config
  argocd_manage_add_ons      = var.argocd_manage_add_ons
}

module "aws_efs_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_efs_csi_driver        = var.enable_aws_efs_csi_driver
  aws_efs_csi_driver_helm_config   = var.aws_efs_csi_driver_helm_config
  aws_efs_csi_driver_irsa_policies = var.aws_efs_csi_driver_irsa_policies
  argocd_manage_add_ons            = var.argocd_manage_add_ons
}

module "aws_fsx_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_fsx_csi_driver        = var.enable_aws_fsx_csi_driver
  aws_fsx_csi_driver_helm_config   = var.aws_fsx_csi_driver_helm_config
  aws_fsx_csi_driver_irsa_policies = var.aws_fsx_csi_driver_irsa_policies
  argocd_manage_add_ons            = var.argocd_manage_add_ons
}

module "aws_for_fluent_bit" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_fsx_csi_driver        = var.enable_aws_fsx_csi_driver
  aws_fsx_csi_driver_helm_config   = var.aws_fsx_csi_driver_helm_config
  aws_fsx_csi_driver_irsa_policies = var.aws_fsx_csi_driver_irsa_policies
  argocd_manage_add_ons            = var.argocd_manage_add_ons
}

module "aws_fsx_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_for_fluentbit                   = var.enable_aws_for_fluentbit
  aws_for_fluentbit_helm_config              = var.aws_for_fluentbit_helm_config
  aws_for_fluentbit_irsa_policies            = var.aws_for_fluentbit_irsa_policies
  aws_for_fluentbit_create_cw_log_group      = var.aws_for_fluentbit_create_cw_log_group
  aws_for_fluentbit_cw_log_group_name        = var.aws_for_fluentbit_cw_log_group_name
  aws_for_fluentbit_cw_log_group_retention   = var.aws_for_fluentbit_cw_log_group_retention
  aws_for_fluentbit_cw_log_group_kms_key_arn = var.aws_for_fluentbit_cw_log_group_kms_key_arn
  argocd_manage_add_ons                      = var.argocd_manage_add_ons
}

module "aws_cloudwatch_metrics" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_cloudwatch_metrics        = var.enable_aws_cloudwatch_metrics
  aws_cloudwatch_metrics_helm_config   = var.aws_cloudwatch_metrics_helm_config
  aws_cloudwatch_metrics_irsa_policies = var.aws_cloudwatch_metrics_irsa_policies
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "aws_load_balancer_controller" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_load_balancer_controller      = var.enable_aws_load_balancer_controller
  aws_load_balancer_controller_helm_config = var.aws_load_balancer_controller_helm_config
  argocd_manage_add_ons                    = var.argocd_manage_add_ons
}

module "aws_node_termination_handler" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_node_termination_handler        = var.enable_aws_node_termination_handler
  auto_scaling_group_names                   = var.auto_scaling_group_names
  enable_karpenter                           = var.enable_karpenter
  aws_node_termination_handler_helm_config   = var.aws_node_termination_handler_helm_config
  aws_node_termination_handler_irsa_policies = var.aws_node_termination_handler_irsa_policies
  argocd_manage_add_ons                      = var.argocd_manage_add_ons
}

module "appmesh_controller" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_appmesh_controller = var.enable_appmesh_controller
  appmesh_helm_config       = var.appmesh_helm_config
  appmesh_irsa_policies     = var.appmesh_irsa_policies
}

module "cert_manager" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cert_manager                            = var.enable_cert_manager
  cert_manager_helm_config                       = var.cert_manager_helm_config
  argocd_manage_add_ons                          = var.argocd_manage_add_ons
  cert_manager_irsa_policies                     = var.cert_manager_irsa_policies
  cert_manager_domain_names                      = var.cert_manager_domain_names
  cert_manager_install_letsencrypt_issuers       = var.cert_manager_install_letsencrypt_issuers
  cert_manager_letsencrypt_email                 = var.cert_manager_letsencrypt_email
  cert_manager_kubernetes_svc_image_pull_secrets = var.cert_manager_kubernetes_svc_image_pull_secrets
}

module "cert_manager_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cert_manager_csi_driver      = var.enable_cert_manager_csi_driver
  cert_manager_csi_driver_helm_config = var.cert_manager_csi_driver_helm_config
  argocd_manage_add_ons               = var.argocd_manage_add_ons
}

module "cert_manager_istio_csr" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cert_manager_istio_csr      = var.enable_cert_manager_istio_csr
  cert_manager_istio_csr_helm_config = var.cert_manager_istio_csr_helm_config
  argocd_manage_add_ons              = var.argocd_manage_add_ons
}

module "cluster_autoscaler" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cluster_autoscaler      = var.enable_cluster_autoscaler
  cluster_autoscaler_helm_config = var.cluster_autoscaler_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
}

module "coredns_autoscaler" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_coredns      = var.enable_amazon_eks_coredns
  enable_coredns_autoscaler      = var.enable_coredns_autoscaler
  coredns_autoscaler_helm_config = var.coredns_autoscaler_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
}

module "crossplane" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_crossplane              = var.enable_crossplane
  crossplane_helm_config         = var.crossplane_helm_config
  crossplane_aws_provider        = var.crossplane_aws_provider
  crossplane_jet_aws_provider    = var.crossplane_jet_aws_provider
  crossplane_kubernetes_provider = var.crossplane_kubernetes_provider
}

module "datadog_operator" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_datadog_operator      = var.enable_datadog_operator
  datadog_operator_helm_config = var.datadog_operator_helm_config
  argocd_manage_add_ons        = var.argocd_manage_add_ons
}

module "external_dns" {
  source = "./external-dns"
  count  = var.enable_external_dns ? 1 : 0

  helm_config         = var.external_dns_helm_config
  manage_via_gitops   = var.argocd_manage_add_ons
  irsa_policies       = var.external_dns_irsa_policies
  domain_name         = var.eks_cluster_domain_name
  private_zone        = var.external_dns_private_zone
  create_route53_zone = var.create_route53_zone
  route53_zone_arns   = var.external_dns_route53_zone_arns
}

module "fargate_fluentbit" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_fargate_fluentbit       = var.enable_fargate_fluentbit
  fargate_fluentbit_addon_config = var.fargate_fluentbit_addon_config
}

module "grafana" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_grafana        = var.enable_grafana
  grafana_helm_config   = var.grafana_helm_config
  grafana_irsa_policies = var.grafana_irsa_policies
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "ingress_nginx" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_ingress_nginx      = var.enable_ingress_nginx
  ingress_nginx_helm_config = var.ingress_nginx_helm_config
  argocd_manage_add_ons     = var.argocd_manage_add_ons
}

module "karpenter" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_karpenter                    = var.enable_karpenter
  karpenter_helm_config               = var.karpenter_helm_config
  karpenter_irsa_policies             = var.karpenter_irsa_policies
  karpenter_node_iam_instance_profile = var.karpenter_node_iam_instance_profile
  karpenter_sqs_queue_arn             = var.karpenter_sqs_queue_arn
  argocd_manage_add_ons               = var.argocd_manage_add_ons
}

module "keda" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_keda           = var.enable_keda
  keda_helm_config      = var.keda_helm_config
  keda_irsa_policies    = var.keda_irsa_policies
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "kubernetes_dashboard" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_kubernetes_dashboard      = var.enable_kubernetes_dashboard
  kubernetes_dashboard_helm_config = var.kubernetes_dashboard_helm_config
  argocd_manage_add_ons            = var.argocd_manage_add_ons
}

module "metrics_server" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_metrics_server      = var.enable_metrics_server
  metrics_server_helm_config = var.metrics_server_helm_config
  argocd_manage_add_ons      = var.argocd_manage_add_ons
}

module "ondat" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_ondat          = var.enable_ondat
  ondat_helm_config     = var.ondat_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
  ondat_irsa_policies   = var.ondat_irsa_policies
  ondat_create_cluster  = var.ondat_create_cluster
  ondat_etcd_endpoints  = var.ondat_etcd_endpoints
  ondat_etcd_ca         = var.ondat_etcd_ca
  ondat_etcd_cert       = var.ondat_etcd_cert
  ondat_etcd_key        = var.ondat_etcd_key
  ondat_admin_username  = var.ondat_admin_username
  ondat_admin_password  = var.ondat_admin_password
}

module "kube_prometheus_stack" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_kube_prometheus_stack      = var.enable_kube_prometheus_stack
  kube_prometheus_stack_helm_config = var.kube_prometheus_stack_helm_config
}

module "portworx" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_portworx      = var.enable_portworx
  portworx_helm_config = var.portworx_helm_config
}

module "prometheus" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_prometheus                    = var.enable_prometheus
  prometheus_helm_config               = var.prometheus_helm_config
  enable_amazon_prometheus             = var.enable_amazon_prometheus
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "reloader" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_reloader       = var.enable_reloader
  reloader_helm_config  = var.reloader_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "spark_history_server" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_spark_history_server        = var.enable_spark_history_server
  spark_history_server_helm_config   = var.spark_history_server_helm_config
  argocd_manage_add_ons              = var.argocd_manage_add_ons
  spark_history_server_irsa_policies = var.spark_history_server_irsa_policies
  spark_history_server_s3a_path      = var.spark_history_server_s3a_path
}

module "spark_k8s_operator" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_spark_k8s_operator      = var.enable_spark_k8s_operator
  spark_k8s_operator_helm_config = var.spark_k8s_operator_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
}

module "strimzi_kafka_operator" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_strimzi_kafka_operator      = var.enable_strimzi_kafka_operator
  strimzi_kafka_operator_helm_config = var.strimzi_kafka_operator_helm_config
  argocd_manage_add_ons              = var.argocd_manage_add_ons
}

module "cluster_autoscaler" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cluster_autoscaler      = var.enable_cluster_autoscaler
  cluster_autoscaler_helm_config = var.cluster_autoscaler_helm_config
  argocd_manage_add_ons          = var.argocd_manage_add_ons
}

module "sysdig_agent" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_sysdig_agent      = var.enable_sysdig_agent
  sysdig_agent_helm_config = var.sysdig_agent_helm_config
}

module "tetrate_istio" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_tetrate_istio              = var.enable_tetrate_istio
  tetrate_istio_distribution        = var.tetrate_istio_distribution
  tetrate_istio_version             = var.tetrate_istio_version
  tetrate_istio_install_base        = var.tetrate_istio_install_base
  tetrate_istio_install_cni         = var.tetrate_istio_install_cni
  tetrate_istio_install_istiod      = var.tetrate_istio_install_istiod
  tetrate_istio_install_gateway     = var.tetrate_istio_install_gateway
  tetrate_istio_base_helm_config    = var.tetrate_istio_base_helm_config
  tetrate_istio_cni_helm_config     = var.tetrate_istio_cni_helm_config
  tetrate_istio_istiod_helm_config  = var.tetrate_istio_istiod_helm_config
  tetrate_istio_gateway_helm_config = var.tetrate_istio_gateway_helm_config
  argocd_manage_add_ons             = var.argocd_manage_add_ons
}

module "thanos" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_thanos         = var.enable_thanos
  thanos_helm_config    = var.thanos_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
  thanos_irsa_policies  = var.thanos_irsa_policies
}

module "traefik" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_traefik        = var.enable_traefik
  traefik_helm_config   = var.traefik_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "vault" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_vault          = var.enable_vault
  vault_helm_config     = var.vault_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "vpa" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_vpa            = var.enable_vpa
  vpa_helm_config       = var.vpa_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "yunikorn" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_yunikorn       = var.enable_yunikorn
  yunikorn_helm_config  = var.yunikorn_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "csi_secrets_store_provider_aws" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_secrets_store_csi_driver_provider_aws = var.enable_secrets_store_csi_driver_provider_aws
  csi_secrets_store_provider_aws_helm_config   = var.csi_secrets_store_provider_aws_helm_config
  argocd_manage_add_ons                        = var.argocd_manage_add_ons
}

module "secrets_store_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_secrets_store_csi_driver      = var.enable_secrets_store_csi_driver
  secrets_store_csi_driver_helm_config = var.secrets_store_csi_driver_helm_config
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "aws_privateca_issuer" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_aws_privateca_issuer        = var.enable_aws_privateca_issuer
  aws_privateca_issuer_helm_config   = var.aws_privateca_issuer_helm_config
  argocd_manage_add_ons              = var.argocd_manage_add_ons
  aws_privateca_acmca_arn            = var.aws_privateca_acmca_arn
  aws_privateca_issuer_irsa_policies = var.aws_privateca_issuer_irsa_policies
}

module "velero" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_velero           = var.enable_velero
  velero_helm_config      = var.velero_helm_config
  argocd_manage_add_ons   = var.argocd_manage_add_ons
  velero_irsa_policies    = var.velero_irsa_policies
  velero_backup_s3_bucket = var.velero_backup_s3_bucket
}

module "opentelemetry_operator" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_amazon_eks_adot             = var.enable_amazon_eks_adot
  enable_opentelemetry_operator      = var.enable_opentelemetry_operator
  eks_cluster_version                = var.eks_cluster_version
  amazon_eks_adot_config             = var.amazon_eks_adot_config
  opentelemetry_operator_helm_config = var.opentelemetry_operator_helm_config
  argocd_manage_add_ons              = var.argocd_manage_add_ons
}

module "adot_collector_java" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_adot_collector_java           = var.enable_adot_collector_java
  adot_collector_java_helm_config      = var.adot_collector_java_helm_config
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "adot_collector_haproxy" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_adot_collector_haproxy        = var.enable_adot_collector_haproxy
  adot_collector_haproxy_helm_config   = var.adot_collector_haproxy_helm_config
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "adot_collector_memcached" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_adot_collector_memcached      = var.enable_adot_collector_memcached
  adot_collector_memcached_helm_config = var.adot_collector_memcached_helm_config
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "adot_collector_nginx" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_adot_collector_nginx          = var.enable_adot_collector_nginx
  adot_collector_nginx_helm_config     = var.adot_collector_nginx_helm_config
  amazon_prometheus_workspace_endpoint = var.amazon_prometheus_workspace_endpoint
  amazon_prometheus_workspace_region   = var.amazon_prometheus_workspace_region
  argocd_manage_add_ons                = var.argocd_manage_add_ons
}

module "kuberay_operator" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_kuberay_operator      = var.enable_kuberay_operator
  kuberay_operator_helm_config = var.kuberay_operator_helm_config
}

module "external_secrets" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_external_secrets               = var.enable_external_secrets
  external_secrets_helm_config          = var.external_secrets_helm_config
  external_secrets_irsa_policies        = var.external_secrets_irsa_policies
  external_secrets_ssm_parameter_arns   = var.external_secrets_ssm_parameter_arns
  external_secrets_secrets_manager_arns = var.external_secrets_secrets_manager_arns
  argocd_manage_add_ons                 = var.argocd_manage_add_ons
}

module "promtail" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_promtail       = var.enable_promtail
  promtail_helm_config  = var.promtail_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "calico" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_calico         = var.enable_calico
  promtail_helm_config  = var.promtail_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "kubecost" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_kubecost       = var.enable_kubecost
  kubecost_helm_config  = var.kubecost_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "kyverno" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_kyverno                      = var.enable_kyverno
  kyverno_helm_config                 = var.kyverno_helm_config
  enable_kyverno_policies             = var.enable_kyverno_policies
  kyverno_policies_helm_config        = var.kyverno_policies_helm_config
  enable_kyverno_policy_reporter      = var.enable_kyverno_policy_reporter
  kyverno_policy_reporter_helm_config = var.kyverno_policy_reporter_helm_config
  argocd_manage_add_ons               = var.argocd_manage_add_ons
}

module "smb_csi_driver" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_smb_csi_driver      = var.enable_smb_csi_driver
  smb_csi_driver_helm_config = var.smb_csi_driver_helm_config
  argocd_manage_add_ons      = var.argocd_manage_add_ons
}

module "chaos_mesh" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_chaos_mesh      = var.enable_chaos_mesh
  chaos_mesh_helm_config = var.chaos_mesh_helm_config
  argocd_manage_add_ons  = var.argocd_manage_add_ons
}

module "cilium" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_cilium           = var.enable_cilium
  cilium_helm_config      = var.cilium_helm_config
  cilium_enable_wireguard = var.cilium_enable_wireguard
  argocd_manage_add_ons   = var.argocd_manage_add_ons
}

module "gatekeeper" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_gatekeeper      = var.enable_gatekeeper
  gatekeeper_helm_config = var.gatekeeper_helm_config
  argocd_manage_add_ons  = var.argocd_manage_add_ons
}

module "local_volume_provisioner" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_local_volume_provisioner      = var.enable_local_volume_provisioner
  local_volume_provisioner_helm_config = var.local_volume_provisioner_helm_config
}
 
module "nvidia_device_plugin" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_nvidia_device_plugin      = var.enable_nvidia_device_plugin
  nvidia_device_plugin_helm_config = var.nvidia_device_plugin_helm_config
  argocd_manage_add_ons            = var.argocd_manage_add_ons
}

module "app_2048" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  enable_app_2048 = var.enable_app_2048
}

module "emr_on_eks" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  eks_cluster_id = var.eks_cluster_id

  emr_on_eks_config     = var.emr_on_eks_config
  enable_emr_on_eks     = var.enable_emr_on_eks
  eks_oidc_provider_arn = var.eks_oidc_provider_arn
  tags                  = var.tags
  argocd_manage_add_ons = var.argocd_manage_add_ons
}

module "consul" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints.git/modules/kubernetes-addons"

  enable_consul         = var.enable_consul
  consul_helm_config    = var.consul_helm_config
  argocd_manage_add_ons = var.argocd_manage_add_ons
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