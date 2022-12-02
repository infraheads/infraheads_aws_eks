variable "eks_cluster_id" {
  description = "EKS Cluster Id"
  type        = string
}

variable "eks_cluster_domain" {
  description = "The domain for the EKS cluster"
  type        = string
  default     = ""
}
#----------- External DNS -----------
variable "enable_external_dns" {
  description = "External DNS add-on"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Domain name of the Route53 hosted zone to use with External DNS."
  type        = string
}


variable "manage_via_gitops" {
  description = "Enable managing add-on configuration via ArgoCD App of Apps"
  type        = bool
  default     = false
}

variable "external_dns_helm_config" {
  description = "External DNS Helm Chart config"
  type        = any
  default     = {}
}

variable "external_dns_irsa_policies" {
  description = "Additional IAM policies for a IAM role for service accounts"
  type        = list(string)
  default     = []
}

variable "external_dns_private_zone" {
  type        = bool
  description = "Determines if referenced Route53 zone is private."
  default     = false
}

variable "external_dns_route53_zone_arns" {
  description = "List of Route53 zones ARNs which external-dns will have access to create/manage records"
  type        = list(string)
  default     = []
}

variable "create_route53_zone" {
  description = "Create a Route53 zone."
  type        = bool
  default     = false
}

#-----------Argo workflows ADDON-------------
variable "enable_argo_workflows" {
  description = "Enable Argo workflows add-on"
  type        = bool
  default     = false
}

variable "argocd_helm_config" {
  description = "Argo CD Kubernetes add-on config"
  type        = any
  default     = {}
}

variable "argo_workflows_helm_config" {
  description = "Argo workflows Helm Chart config"
  type        = any
  default     = null
}

#-----------ARGOCD ADDON-------------
variable "enable_argocd" {
  description = "Enable Argo CD Kubernetes add-on"
  type        = bool
  default     = false
}

variable "argocd_helm_config" {
  description = "Argo CD Kubernetes add-on config"
  type        = any
  default     = {}
}

variable "argocd_applications" {
  description = "Argo CD Applications config to bootstrap the cluster"
  type        = any
  default     = {}
}

variable "argocd_manage_add_ons" {
  description = "Enable managing add-on configuration via ArgoCD App of Apps"
  type        = bool
  default     = false
}

#-----------Crossplane ADDON-------------
variable "enable_crossplane" {
  description = "Enable Crossplane add-on"
  type        = bool
  default     = false
}

variable "crossplane_helm_config" {
  description = "Crossplane Helm Chart config"
  type        = any
  default     = null
}

variable "crossplane_aws_provider" {
  description = "AWS Provider config for Crossplane"
  type = object({
    enable                   = bool
    provider_aws_version     = string
    additional_irsa_policies = list(string)
  })
  default = {
    enable                   = false
    provider_aws_version     = "v0.24.1"
    additional_irsa_policies = []
  }
}

variable "crossplane_jet_aws_provider" {
  description = "AWS Provider Jet AWS config for Crossplane"
  type = object({
    enable                   = bool
    provider_aws_version     = string
    additional_irsa_policies = list(string)
  })
  default = {
    enable                   = false
    provider_aws_version     = "v0.24.1"
    additional_irsa_policies = []
  }
}

variable "crossplane_kubernetes_provider" {
  description = "Kubernetes Provider config for Crossplane"
  type = object({
    enable                      = bool
    provider_kubernetes_version = string
  })
  default = {
    enable                      = false
    provider_kubernetes_version = "v0.4.1"
  }
}

variable "data_plane_wait_arn" {
  description = "Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons"
  type        = string
  default     = ""
}