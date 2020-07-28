module "eks_workers" {
  source                                 = "git::https://github.com/cloudposse/terraform-aws-eks-workers.git?ref=tags/0.11.0"
  namespace                              = var.namespace
  stage                                  = var.stage
  name                                   = var.name
  attributes                             = var.attributes
  tags                                   = var.tags
  instance_type                          = var.instance_type
  eks_worker_ami_name_filter             = local.eks_worker_ami_name_filter
  vpc_id                                 = aws_vpc.vpc.id
  subnet_ids                             = flatten([aws_subnet.public.*.id])
  associate_public_ip_address            = var.associate_public_ip_address
  health_check_type                      = var.health_check_type
  min_size                               = var.eks_workers_asg_min_size
  max_size                               = var.eks_workers_asg_max_size
  wait_for_capacity_timeout              = var.wait_for_capacity_timeout
  cluster_name                           = module.eks_label.id
  cluster_endpoint                       = module.eks_cluster.eks_cluster_endpoint
  cluster_certificate_authority_data     = module.eks_cluster.eks_cluster_certificate_authority_data
  cluster_security_group_id              = module.eks_cluster.security_group_id
  key_name                               = var.ssh_key_name

  # Auto-scaling policies and CloudWatch metric alarms
  autoscaling_policies_enabled           = var.autoscaling_policies_enabled
  cpu_utilization_high_threshold_percent = var.cpu_utilization_high_threshold_percent
  cpu_utilization_low_threshold_percent  = var.cpu_utilization_low_threshold_percent
}
