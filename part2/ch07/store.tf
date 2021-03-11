resource "docker_image" "cassandra" {
  name         = "cassandra:latest"
  keep_locally = false
}

resource "docker_container" "cortex-cluster-store" {
  image = docker_image.cassandra.latest
  name  = "cortex-cluster-store"
  network_mode = "bridge"
  networks_advanced {
      name = docker_network.cortex-cluster.name
  }
}
