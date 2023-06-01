#-------------------------
# WORKER NODE GROUP 
#-------------------------

resource "aws_eks_node_group" "eksnode" {
  cluster_name    = "eksclusterdemo"
  node_group_name = "nodegrp"
  node_role_arn   = aws_iam_role.eksnoderole.arn
  subnet_ids      = ["subnet-0494029d4e9765eff","subnet-0f013d1175068d39d","subnet-00470c30e83a3b8aa"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eksnoderole-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eksnoderole-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eksnoderole-AmazonEC2ContainerRegistryReadOnly,
  ]
}


#-------------------------
# IAM ROLE FOR WORKER NODE GROUP 
#-------------------------


resource "aws_iam_role" "eksnoderole" {
  name = "eksnoderole"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eksnoderole-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eksnoderole.name
}

resource "aws_iam_role_policy_attachment" "eksnoderole-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eksnoderole.name
}

resource "aws_iam_role_policy_attachment" "eksnoderole-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eksnoderole.name
}
