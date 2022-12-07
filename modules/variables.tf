variable "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  type        = string
}

variable "eks_oidc_provider" {
  description = "EKS Cluster oidc provider"
  type        = string
}

variable "eks_cluster_version" {
  description = "EKS Cluster version"
  type        = string
}

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

#-----------ArgoCD ADDON-------------
variable "enable_argocd" {
  description = "Enable Argo CD Kubernetes add-on"
  type        = bool
  default     = false
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

#-----------ArgoCD Apps-----------
variable "enable_argocd_apps" { 
  description = "Enable ArgoCD Apps."
  type        = bool
  default     = false
}

variable "argocd_apps_chart_repo" {
  description = "Argocd apps helm chart repository"
  type        = string
  default     = ""
}

variable "argocd_apps_chart_name" {
  description = "Argocd application helm chart name "
  type        = string
  default     = ""
}

variable "argocd_apps_chart_version" {
  description = "Argocd apps helm chart version"
  type        = string
  default     = ""
}

variable "argocd_apps_namespace" {
  description = "Argocd apps namespace"
  type        = string
  default     = ""
}

variable "argocd_apps_values" {
  description = "Values file for ArgoCD apps."
  type        = string
  default     = ""
}

variable "argocd_apps_name" {
  description = "Name for ArgoCD apps."
  type        = string
  default     = ""
}

variable "argocd_apps_project" {
  description = "Project for ArgoCD apps."
  type        = string
  default     = ""
}

variable "argocd_apps_source_repo" {
  description = "Source repository for ArgoCD apps."
  type        = string
  default     = ""
}

variable "argocd_apps_source_target_revision" {
  description = "Source repository's target revision for ArgoCD apps."
  type        = string
  default     = ""
}

variable "argocd_apps_source_target_path" {
  description = "Source repository's path on which ArgoCD apps are."
  type        = string
  default     = ""
}

variable "argocd_apps_source_target_recurse" {
  description = "Source repository's directory recurse in which ArgoCD apps are."
  type        = bool
  default     = false
}

variable "argocd_apps_destination_namespace" {
  description = "Destination namespace in which the applications will deploy manifests or charts."
  type        = string
  default     = ""
}

variable "argocd_apps_prune" {
  description = "Whether enable prune function for ArgoCD apps."
  type        = bool
  default     = false
}

variable "argocd_apps_self_heal" {
  description = "Whether enable self heal function for ArgoCD apps."
  type        = bool
  default     = false
}

#---------Github repo----------
variable "enable_github_repo" {
  description = "Enable Github repo"
  type        = bool
  default     = false
}

variable "github_repo_name" {
  description = "The name of the GitHub repository that will be created."
  type        = string
}

variable "github_description" {
  description = "The description of the GitHub repository that will be created."
  type        = string
  default     = ""
}

variable "github_visibility" {
  description = "The visibility of the GitHub repository that will be created."
  type        = string
  default     = ""
}

variable "github_template_owner" {
  description = "GitHub template repository name. (Default: provider_owner)"
  type        = string
  default     = ""
}

variable "github_template_repo_name" {
  description = "GitHub template repository name. (Will not use a template, if not set)"
  type        = string
  default     = ""
}