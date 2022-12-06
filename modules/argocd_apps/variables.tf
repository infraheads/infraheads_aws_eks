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
variable "argocd_apps_repo_url" {
	type = string
	description = "Girhub repository url for argocd-apps"
	default = ""
}
variable "argocd_apps_repo_path" {
	type = string
	description = "Repository path for argocds applications"
	default = "/"
}
variable "project_namespace" {
	type = string
	description = "Namespace for project"
	# default = "default"
}
variable "argocd_apps_values" {
	type = any
	description = "values file for argocd-apps"
}