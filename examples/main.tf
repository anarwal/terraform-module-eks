provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "uwm_kube_cluster" {
  source                   = "../module/"
  region                   = var.region
  cidr_block               = var.cidr_block
  private_subnets          = var.private_subnets
  public_subnets           = var.public_subnets
  availability_zones       = var.availability_zones
  namespace                = var.namespace
  stage                    = var.stage
  attributes               = var.attributes
  name                     = var.name
  eks_workers_asg_max_size = var.eks_workers_asg_max_size
  eks_workers_asg_min_size = var.eks_workers_asg_min_size
  kubernetes_version       = var.kubernetes_version
}
