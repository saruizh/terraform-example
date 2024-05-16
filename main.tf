terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "Token123"
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome web page"
  private     = false
}

resource "github_repository_file" "example_folder" {
  repository = github_repository.example.name
  file = "main.tf"
  content    = "terraform {required_providers...}"
}


resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
}

resource "github_branch" "analisis" {
  repository = github_repository.example.name
  branch     = "analisis"
}

resource "github_branch" "automation" {
  repository = github_repository.example.name
  branch     = "automation"
}