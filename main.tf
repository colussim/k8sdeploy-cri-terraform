terraform {
  required_providers {
    external = {
      source = "hashicorp/external"
      version = "2.1.0"
    }
     ssh = {
      source = "loafoe/ssh"
    }	
  }
}
