locals {
  # The usage of the specific kubernetes.io/cluster/* resource tags below are required
  # for EKS and Kubernetes to discover and manage networking resources
  # https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html#base-vpc-networking
  cluster_tags        = merge(module.eks_label.tags, map("kubernetes.io/cluster/${module.eks_label.id}", "shared"))
  public_subnet_tags  = merge(module.eks_label.tags, local.cluster_tags, map("kubernetes.io/role/elb", "1"))
  private_subnet_tags = merge(module.eks_label.tags, local.cluster_tags, map("kubernetes.io/role/internal-elb", "1"))

  # Unfortunately, most_recent (https://github.com/cloudposse/terraform-aws-eks-workers/blob/34a43c25624a6efb3ba5d2770a601d7cb3c0d391/main.tf#L141)
  # variable does not work as expected, if you are not going to use custom AMI you should
  # enforce usage of eks_worker_ami_name_filter variable to set the right kubernetes version for EKS workers,
  # otherwise the first version of Kubernetes supported by AWS (v1.11) for EKS workers will be used, but
  # EKS control plane will use the version specified by kubernetes_version variable.
  eks_worker_ami_name_filter = "amazon-eks-node-${var.kubernetes_version}*"
}
