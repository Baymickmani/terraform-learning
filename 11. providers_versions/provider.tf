terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "> 1.3.0, != 1.4.0"
    }
  }
}

provider "local" {
  # Configuration options
}