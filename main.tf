terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" 

resource "docker_image" "ubuntu" {
  name         = "ubuntu"
  keep_locally = false
}


resource "docker_container" "ubuntu" {
  image = docker_image.ubuntu
  name  = "ubuntu"
  ports {
    internal = 80
    external = 8000
  }
}
