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

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  type        = map(string)
  default     = {}
}

variable "irsa_iam_role_path" {
  description = "IAM role path for IRSA roles"
  type        = string
  default     = "/"
}

variable "irsa_iam_permissions_boundary" {
  description = "IAM permissions boundary for IRSA roles"
  type        = string
  default     = ""
}

#-----------EXTERNAL DNS-----------
variable "enable_external_dns" {
  description = "External DNS add-on"
  type        = bool
  default     = false
}
variable "data_plane_wait_arn" {
  description = "Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons"
  type        = string
  default     = ""
}

variable "eks_cluster_domain_name" {
  description = "Domain name of the Route53 hosted zone to use with External DNS."
  type        = string
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

#-----------ARGOCD WORKFLOWS-------------
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

#-----------ARGOCD APPS-----------
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

#-----------GITHUB REPO-------------
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

#-----------CERT MANAGER-------------
variable "enable_cert_manager" {
  description = "Enable Cert Manager add-on"
  type        = bool
  default     = false
}

variable "cert_manager_helm_config" {
  description = "Cert Manager Helm Chart config"
  type        = any
  default     = {}
}

variable "cert_manager_irsa_policies" {
  description = "Additional IAM policies for a IAM role for service accounts"
  type        = list(string)
  default     = []
}

variable "cert_manager_domain_names" {
  description = "Domain names of the Route53 hosted zone to use with cert-manager"
  type        = list(string)
  default     = []
}

variable "cert_manager_install_acme_issuers" {
  description = "Install ACME Cluster Issuers"
  type        = bool
  default     = true
}

variable "cert_manager_email" {
  description = "Email address for expiration emails from ACME"
  type        = string
  default     = ""
}

variable "enable_cert_manager_csi_driver" {
  description = "Enable Cert Manager CSI Driver add-on"
  type        = bool
  default     = false
}

variable "cert_manager_csi_driver_helm_config" {
  description = "Cert Manager CSI Driver Helm Chart config"
  type        = any
  default     = {}
}

variable "cert_manager_kubernetes_svc_image_pull_secrets" {
  description = "list(string) of kubernetes imagePullSecrets"
  type        = list(string)
  default     = []
}

variable "enable_cert_manager_istio_csr" {
  description = "Enable Cert Manager istio-csr add-on"
  type        = bool
  default     = false
}

variable "cert_manager_istio_csr_helm_config" {
  description = "Cert Manager Istio CSR Helm Chart config"
  type        = any
  default     = {}
}

variable "cert_manager_cluster_issuer_name" {
  description = "Prefix of cluster issuer release"
  type        = string
  default     = ""
}

variable "cert_manager_external_account_keyID" {
  description = "ID of the CA key that the External Account is bound to."
  type        = string
  default     = ""
}

variable "cert_manager_external_account_secret_key" {
  description = "Secret key of the CA that the External Account is bound to."
  type        = string
  default     = ""
}

variable "cert_manager_preferred_chain" {
  description = "Chain to use if the ACME server outputs multiple."
  type        = string
  default     = ""
}

variable "cert_manager_acme_server_url" {
  description = "The URL used to access the ACME server's 'directory' endpoint."
  type        = string
  default     = ""
}

variable "cert_manager_dns_region" {
  description = "DNS Region"
  type        = string
  default     = ""
}

variable "cert_manager_certificate_common_name" {
  description = "Common name to be used on the Certificate."
  type        = string
  default     = ""
}

variable "cert_manager_certificate_is_ca" {
  description = "IsCA will mark this Certificate as valid for certificate signing."
  type        = bool
  default     = true
}

variable "cert_manager_hosted_zone_id" {
  description = "If set, the provider will manage only this zone in Route53 and will not do an lookup using the route53:ListHostedZonesByName api call."
  type        = string
  default     = ""
}