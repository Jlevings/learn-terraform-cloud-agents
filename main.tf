terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

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
