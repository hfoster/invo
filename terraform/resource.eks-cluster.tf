resource "aws_eks_cluster" "cluster" {
  name     = "eks-cluster-invo"
  role_arn = aws_iam_role.eks-cluster-role.arn

  vpc_config {
    subnet_ids = aws_subnet.compute.*.id
  }
}
