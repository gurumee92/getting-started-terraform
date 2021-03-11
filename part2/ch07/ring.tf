resource "docker_image" "consul" {
  name         = "consul:latest"
  keep_locally = false
}

resource "docker_container" "cortex-cluster-hash-ring" {
  image = docker_image.consul.latest
  name  = "cortex-cluster-hash-ring"
  network_mode = "bridge"
  networks_advanced {
      name = docker_network.cortex-cluster.name
  }
  env = ["CONSUL_BIND_INTERFACE=eth0"]
}
