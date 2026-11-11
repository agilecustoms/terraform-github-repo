output "id" {
  description = "Repository id"
  value       = github_repository.repo.id
}

output "name" {
  description = "Repository name"
  value       = var.name
}
