variable "aws_region" {
  description = "AWS Deployment region."
  type = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type    = string
}

variable "environment" {
  description = "For specifying environments"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the private subnet"
}


variable "availability_zones" {
  type        = list
  description = "The az that the resources will be launched"
}

variable "iam_name" {
  description = "iam role name"
  type    = string
}

variable "iam_role_worker_name" {
  description = "iam role name for worker node"
  type    = string
}

variable "instance_types" {
  description = "instance type used for worker node"
  type    = list
}

variable "vpc_name" {
  description = "name of vpc"
  type    = string
}

variable "eks_version" {
  description = "Specific EKS Version"
}

variable "worker_node_name" {
  description = "instance name worker node"
  type    = string
}

variable "node_group_template" {
  description = "template for worker node"
  type    = string
}

variable "node_group_name" {
  description = "name of the node group"
  type    = string
}

variable "improved" {
  description = "the beta version of the eks cluster"
  type    = string
}

