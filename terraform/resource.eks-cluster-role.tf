resource "aws_iam_role" "eks-cluster-role" {
  name               = "invo-eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks-assume-role.json
}

resource "aws_iam_role_policy_attachment" "eks-cluster-role-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-role.name
}
