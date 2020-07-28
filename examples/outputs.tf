output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.uwm_kube_cluster.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.uwm_kube_cluster.private_subnet_ids
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.uwm_kube_cluster.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = module.uwm_kube_cluster.vpc_cidr
}

output "eks_cluster_security_group_id" {
  description = "ID of the EKS cluster Security Group"
  value       = module.uwm_kube_cluster.eks_cluster_security_group_id
}

output "eks_cluster_security_group_arn" {
  description = "ARN of the EKS cluster Security Group"
  value       = module.uwm_kube_cluster.eks_cluster_security_group_arn
}

output "eks_cluster_security_group_name" {
  description = "Name of the EKS cluster Security Group"
  value       = module.uwm_kube_cluster.eks_cluster_security_group_name
}

output "eks_cluster_id" {
  description = "The name of the cluster"
  value       = module.uwm_kube_cluster.eks_cluster_id
}

output "eks_cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.uwm_kube_cluster.eks_cluster_arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value       = module.uwm_kube_cluster.eks_cluster_endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes server version of the cluster"
  value       = module.uwm_kube_cluster.eks_cluster_version
}

output "workers_launch_template_id" {
  description = "ID of the launch template"
  value       = module.uwm_kube_cluster.workers_launch_template_id
}

output "workers_launch_template_arn" {
  description = "ARN of the launch template"
  value       = module.uwm_kube_cluster.workers_launch_template_arn
}

output "workers_autoscaling_group_id" {
  description = "The AutoScaling Group ID"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_id
}

output "workers_autoscaling_group_name" {
  description = "The AutoScaling Group name"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_name
}

output "workers_autoscaling_group_arn" {
  description = "ARN of the AutoScaling Group"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_arn
}

output "workers_autoscaling_group_min_size" {
  description = "The minimum size of the AutoScaling Group"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_min_size
}

output "workers_autoscaling_group_max_size" {
  description = "The maximum size of the AutoScaling Group"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_max_size
}

output "workers_autoscaling_group_desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_desired_capacity
}

output "workers_autoscaling_group_default_cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_default_cooldown
}

output "workers_autoscaling_group_health_check_grace_period" {
  description = "Time after instance comes into service before checking health"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_health_check_grace_period
}

output "workers_autoscaling_group_health_check_type" {
  description = "`EC2` or `ELB`. Controls how health checking is done"
  value       = module.uwm_kube_cluster.workers_autoscaling_group_health_check_type
}

output "workers_security_group_id" {
  description = "ID of the worker nodes Security Group"
  value       = module.uwm_kube_cluster.workers_security_group_id
}

output "workers_security_group_arn" {
  description = "ARN of the worker nodes Security Group"
  value       = module.uwm_kube_cluster.workers_security_group_arn
}

output "workers_security_group_name" {
  description = "Name of the worker nodes Security Group"
  value       = module.uwm_kube_cluster.workers_security_group_name
}

output "workers_role_arn" {
  description = "ARN of the worker nodes IAM role"
  value       = module.uwm_kube_cluster.workers_role_arn
}

output "workers_role_name" {
  description = "Name of the worker nodes IAM role"
  value       = module.uwm_kube_cluster.workers_role_name
}
