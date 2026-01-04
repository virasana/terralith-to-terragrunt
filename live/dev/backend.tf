terraform {
  backend "s3" {
    bucket       = "terragrunt-to-terralith-tfstate-ks-20260104"
    key          = "dev/tofu.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}