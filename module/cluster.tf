module "eks_cluster" {
  source                     = "git::https://github.com/cloudposse/terraform-aws-eks-cluster.git?ref=tags/0.16.0"
  namespace                  = var.namespace
  stage                      = var.stage
  name                       = var.name
  attributes                 = var.attributes
  tags                       = var.tags
  region                     = var.region
  vpc_id                     = aws_vpc.vpc.id
  subnet_ids                 = flatten([aws_subnet.public.*.id])
  kubernetes_version         = var.kubernetes_version
  kubeconfig_path            = var.kubeconfig_path
  install_aws_cli            = var.install_aws_cli
  install_kubectl            = var.install_kubectl
  workers_role_arns          = [module.eks_workers.workers_role_arn]
  workers_security_group_ids = [module.eks_workers.security_group_id]
}
