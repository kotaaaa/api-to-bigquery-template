terraform {
  required_version = "~> 0.13.5"
  backend "gcs" {
    bucket = "collecting-tf-state"
  }
}

provider "google" {
  region  = var.region
  version = "~> 3.49"
  project = "gcp-compute-engine-343613" 
}

data "google_project" "collecting" {
  project_id = "gcp-compute-engine-343613" 
}

output "workspace" {
  value = terraform.workspace
}

output "gcp_project" {
  value = data.google_project.collecting
}

output "gcp_region" {
  value = var.region
}

output "gcp_zone" {
  value = var.zone
}

data "google_service_account" "terraform_service_account" {
  account_id = "terraform-service-account"
}
