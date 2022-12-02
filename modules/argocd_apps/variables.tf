variable "argocd_apps_chart_repo" {
	type = string
	description = "Argocd apps helm chart repository"
	default = "https://argoproj.github.io/argo-helm"
}
variable "argocd_apps_chart_name" {
	type = string
	description = "Argocd application helm chart name "
	default = "argocd-apps"
}
variable "argocd_apps_chart_version" {
	type = string
	description = "Argocd apps helm chart version"
	default = "0.0.3"
}
variable "argocd_apps_namespace" {
	type = string
	description = "Argocd apps namespace"
	default = "argocd"
}
