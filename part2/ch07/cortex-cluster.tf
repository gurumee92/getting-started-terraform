resource "docker_image" "cortex" {
  name         = "cortexproject/cortex:master-c48532e"
  keep_locally = false
}

resource "docker_container" "cortex" {
  image = docker_image.cortex.latest
  name  = "cortex-node"
  network_mode = "bridge"
  networks_advanced {
      name = docker_network.cortex-cluster.name
  }

  volumes {
      container_path="/etc/single-process-config.yaml"
      host_path="/Users/a1101320/Studies/gitbooks/gurumee-terraform/code/part2/ch07/configs/single-process-config.yaml"
      read_only = false
  }

  env = [
    "config.file=/etc/single-process-config.yaml",
    "ring.store=consul",
    "consul.hostname=${docker_container.cortex-cluster-hash-ring.name}:8500"
  ]
}

