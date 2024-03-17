resource "aws_eks_fargate_profile" "fargate-profile" {
  cluster_name           = aws_eks_cluster.cluster.name
  fargate_profile_name   = "invo"
  subnet_ids             = aws_subnet.compute.*.id
  pod_execution_role_arn = aws_iam_role.eks-fargate-pod-role.arn

  selector {
    namespace = "invo"
  }
}
