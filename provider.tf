terraform {
  cloud {
    organization = "CG_Tokyo"

    workspaces {
      name = ""
    }
  }
}

provider "aws" {
  region = var.region
}