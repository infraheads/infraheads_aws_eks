variable "argocd_apps_chart_repo" {
  description = "Argocd apps helm chart repository."
  type        = string
  default     = ""
}

variable "argocd_apps_chart_name" {
  description = "Argocd application helm chart name."
  type        = string
  default     = ""
}

variable "argocd_apps_chart_version" {
  description = "Argocd apps helm chart version."
  type        = string
  default     = ""
}

variable "argocd_apps_namespace" {
  description = "Argocd apps namespace."
  type        = string
  default     = ""
}

variable "argocd_apps_values" {
  description = "values file for argocd-apps."
  type        = any
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
