provider "ibm" {
  bluemix_api_key    = "<bluemix_api>"
  softlayer_username = "<softlayer-username>"
  softlayer_api_key  = "<softlayer-password>"
}

variable hostname {
  default = "itiro-terraform"
}

# Create a virtual server with the SSH key
resource "ibm_compute_vm_instance" "itiro_server" {
  count                = "5"
  hostname             = "${var.hostname}${format("-%02d", count.index + 1)}"
  domain               = "sl1029307.sl.edst.ibm.com"
  datacenter           = "sao01"
  cores                = 1
  memory               = 1024
  os_reference_code    = "CENTOS_LATEST"
  hourly_billing       = true
  disks                = [25]
  local_disk           = false
  network_speed        = 1000
  private_network_only = false
  ssh_key_ids          = [1078435,1113449]
  tags                 = ["itiro","itiro-master"]
}

# Create a IBM Cloud Load Balancer and configure with newly created VSi
resource "ibm_lbaas" "lbaas-terraform" {
  name        = "terraformLB"
  description = "terraform test"
  subnets     = [1052249]

  protocols = [{
      frontend_protocol     = "HTTP"
      frontend_port         = 80
      backend_protocol      = "HTTP"
      backend_port          = 80
      load_balancing_method = "round_robin"
    },
  ]

  server_instances = [
    {
      "private_ip_address" = "${ibm_compute_vm_instance.itiro_server.0.ipv4_address_private}"
    },
    {
      "private_ip_address" = "${ibm_compute_vm_instance.itiro_server.1.ipv4_address_private}"
    },
    {
      "private_ip_address" = "${ibm_compute_vm_instance.itiro_server.2.ipv4_address_private}"
    },
    {
      "private_ip_address" = "${ibm_compute_vm_instance.itiro_server.3.ipv4_address_private}"
    },
    {
      "private_ip_address" = "${ibm_compute_vm_instance.itiro_server.4.ipv4_address_private}"
    },
  ]
}
