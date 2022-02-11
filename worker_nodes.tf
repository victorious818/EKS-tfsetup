resource "aws_iam_role" "worker_node_iam" {
  name = var.iam_role_worker_name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "policy_EKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.worker_node_iam.name
}

resource "aws_iam_role_policy_attachment" "policy_EKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.worker_node_iam.name
}

resource "aws_iam_role_policy_attachment" "policy_EC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.worker_node_iam.name
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.node_group_name}-${var.environment}"
  node_role_arn   = aws_iam_role.worker_node_iam.arn
  subnet_ids      = aws_subnet.private_subnet[*].id

  scaling_config {
    desired_size = 1
    max_size     = 6
    min_size     = 1
  }  

  instance_types = var.instance_types
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  
  launch_template{
    name = aws_launch_template.eks_ng_template.name
   # id = aws_launch_template.eks_ng_template.id
    version = aws_launch_template.eks_ng_template.latest_version
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.policy_EKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.policy_EKS_CNI_Policy,
    aws_iam_role_policy_attachment.policy_EC2ContainerRegistryReadOnly,
  ]
}
