include "root" {
  path = find_in_parent_folders("root.hcl")
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "terragrunt-to-terralith-tfstate-ks-20260104"
    key            = "prod/tofu.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}

terraform {
    source = "../../catalog/modules//best_cat"
}

inputs = {
    name = "best-cat-ks-20260104-dev"
    lambda_zip_file = "${get_repo_root()}/dist/best-cat.zip"
}