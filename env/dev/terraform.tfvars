aws_region = "eu-west-2"

environment = "dev"

cluster_name ="Mojec"

eks_version = "1.21"

iam_role_worker_name = "worker_node_iam"

vpc_cidr             = "10.0.0.0/16"

public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]

private_subnets_cidr =  ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24" ]

availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

iam_name = "eks_iam_dev"

worker_node_name = "eks_node"

instance_types = ["t3.xlarge", "t3.xlarge", "t3.xlarge"]

vpc_name = "eks_vpc"

node_group_template = "eks_ng_template"

node_group_name = "eks_node_group"

