resource "aws_launch_template" "eks_ng_template" {
  name = var.node_group_template

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 100
      delete_on_termination = true
      encrypted             = true
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 2
    threads_per_core = 1
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = true
  
  ebs_optimized = true
  
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.environment}_${var.worker_node_name}"
    }
  }

}