variable "github_repo_name" {
  description = "The name of the GitHub repository that will be created."
  type = string
}

variable "description" {
  description = "The description of the GitHub repository that will be created."
  type = string
  default = ""
}

variable "visibility" {
  description = "The visibility of the GitHub repository that will be created."
  type = string
  default = "public"
}

variable "template_owner" {
  description = "GitHub template repository name. (Default: provider_owner)"
  type = string
  default = ""
}

variable "template_repo_name" {
  description = "GitHub template repository name. (Will not use a template, if not set)"
  type = string
  default = ""
}
# variable "github_token" {
# 	type = string
# 	description = "Github repository token"
# }
# variable "github_owner" {
# 	type = string
# 	description = "Github repository owner"
  
# }
