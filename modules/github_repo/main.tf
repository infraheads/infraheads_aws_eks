
resource "github_repository" "repository" {
  name        = var.github_repo_name
  description = var.description

  visibility = var.visibility

  dynamic "template" {
    for_each = var.template_repo_name != "" ? [1] : []

    content {
      owner      = var.template_owner
      repository = var.template_repo_name
    }
  }
}