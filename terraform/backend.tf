terraform {
  backend "s3" {
    bucket       = "kavya-terraform-state-1234"
    key          = "terraform-infrastructure/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
