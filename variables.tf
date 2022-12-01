#EKS
variable "cluster_name" {
	type = string
	description = "EKS cluster name"
	default = "EKS cluster"
}



#  variable "argocd_admin_password" {
# 	type = string
# 	description = "Argocd admin password"
# 	default = null
#  }
variable "create_github_repo" {
	type = bool
	description = "Create github repository for argocd_apps?"
	default = false
  
}
variable "github_repo_visibility" {
	type = string
	description = "Visibility to github repository public/private"
	default = "public"
	validation {
    condition     = containts(["public","private"], var.github_repo_visibility)
    error_message = "Err: Visibility is not valid. Use 'public' or 'private'"
  }
  
}
variable "github_template_repo_owner" {
	type = string
	description = "Github template repository owner"
	default = ""
  
}
variable "github_template_repo_name" {
	type = string
	description = "Github template repository name"
	default = ""
  
}


