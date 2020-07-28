# terraform-module-eks

Usage:
```
module "uwm_kube_cluster" {
  source                   = "../../module/"
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

output "public_subnets_ids" {
  description = "Public subnet IDs"
  value       = module.uwm_kube_cluster.public_subnets_ids
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
```

Reference module: https://github.com/cloudposse/terraform-aws-eks-cluster

## INPUT VALUES

| Input                                  | Description                                                                                                                                                                 | Type    | Default          | Required |
| ---------------------------------------| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------| --------|------------------|----------|
| namespace                              | Namespace, which could be your organization name or abbreviation"                                                                                                           |`string` | ""               | yes      |
| stage                                  | Stage, e.g. 'prod', 'staging', 'dev'                                                                                                                                        |`string` | ""               | yes      |
| name                                   | Solution name, e.g. 'app' or 'jenkins'                                                                                                                                      |`string` | ""               | yes      |
| region                                 | AWS region                                                                                                                                                                  |`string` | ""               | yes      |                                        
| cidr_block                             | CIDR block for the VPC                                                                                                                                                      |`string` | ""               | yes      |       
| private_subnets                        | List of private subnets (Value needs to be in CIDR Block range)                                                                                                             |`string` | ""               | yes      |       
| public_subnets                         | List of public subnets (Value needs to be in CIDR Block range)                                                                                                              |`string` | ""               | yes      |
| availability_zones                     | List of availability zones                                                                                                                                                  |`list`   | ""               | yes      |
| ssh_key_name                           | SSH Key name to connect to worker node                                                                                                                                      |`string` | ""               | yes      |
| eks_workers_asg_max_size               | The maximum size of kubernetes workers AutoScaling Group                                                                                                                    |`number` | ""               | yes      |
| eks_workers_asg_min_size               | The minimum size of kubernetes workers AutoScaling Group                                                                                                                    |`number` | ""               | yes      |
| kubernetes_version                     | Desired Kubernetes master version. If you do not specify a value, the latest available version is used                                                                      |`string` | ""               | yes      |   
| attributes                             | Additional attributes                                                                                                                                                       |`list`   | `<list>`         | no       |           
| delimiter                              | Delimiter to be used between namespace, environment, stage, name and attributes                                                                                             |`string` | "-"              | no       |
| tags                                   | Additional tags (e.g. `map('BusinessUnit`,`XYZ`)                                                                                                                            |`map`    | ""               | no       |
| instance_type                          | Instance type to launch                                                                                                                                                     |`string` | `t2.small`       | no       |
| health_check_type                      | Controls how health checking is done. Valid values are `EC2` or `ELB`                                                                                                       |`string` | `EC2`            | no       |
| associate_public_ip_address            | Associate a public IP address with an instance in a VPC                                                                                                                     |`bool`   | `true`           | no       |
| wait_for_capacity_timeout              | A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to '0' causes Terraform to skip all Capacity Waiting behavior |`string` | `10m`            | no       |
| autoscaling_policies_enabled           | Whether to create `aws_autoscaling_policy` and `aws_cloudwatch_metric_alarm` resources to control Auto Scaling                                                              |`bool`   | `true`           | no       |
| cpu_utilization_high_threshold_percent | Worker nodes AutoScaling Group CPU utilization high threshold percent                                                                        `                              |`number` | `80`             | no       |
| cpu_utilization_low_threshold_percent  | Worker nodes AutoScaling Group CPU utilization low threshold percent                                                                                                        |`number` | `20`             | no       |
| kubeconfig_path                        | The path to `kubeconfig` file                                                                                                                                               |`string` | `~/.kube/config` | no       |
| install_aws_cli                        | Set to `true` to install AWS CLI if the module is provisioned on workstations where AWS CLI is not installed by default, e.g. Terraform Cloud workers"                      |`bool`   | `false`          | no       |
| install_kubectl                        | Set to `true` to install `kubectl` if the module is provisioned on workstations where `kubectl` is not installed by default, e.g. Terraform Cloud workers"                  |`bool`   | `false`          | no       |    

## OUTPUT VALUE NAMES

| Name                                                | Description                                                            | 
| ----------------------------------------------------| -----------------------------------------------------------------------| 
| vpc_id                                              | VPC ID                                                                 | 
| vpc_cidr_block                                      | VPC CIDR                                                               | 
| public_subnet_ids                                   | Comma-separated list of public subnet IDs.                             | 
| private_subnets_ids                                 | Comma-separated list of private subnet IDs.                            | 
| availability_zones                                  | List of availability zones of the VPC.                                 |
| public_rtb_id                                       | Public route table ID.                                                 | 
| nat_gw_id                                           | NAT Gateway ID.                                                        | 
| nat_gw_eip                                          | Public EIP of of NAT Gateway                                           | 
| eks_cluster_security_group_id                       | ID of the EKS cluster Security Group                                   | 
| eks_cluster_security_group_arn                      | ARN of the EKS cluster Security Group                                  | 
| eks_cluster_security_group_name                     | Name of the EKS cluster Security Group                                 | 
| eks_cluster_id                                      | The name of the cluster                                                | 
| eks_cluster_arn                                     | The Amazon Resource Name (ARN) of the cluster                          | 
| eks_cluster_endpoint                                | The endpoint for the Kubernetes API server                             | 
| eks_cluster_version                                 | The Kubernetes server version of the cluster                           | 
| workers_launch_template_id                          | ID of the launch template                                              | 
| workers_launch_template_arn                         | ARN of the launch template                                             | 
| workers_autoscaling_group_id                        | The AutoScaling Group ID                                               | 
| workers_autoscaling_group_name                      | The AutoScaling Group name                                             | 
| workers_autoscaling_group_arn                       | ARN of the AutoScaling Group                                           | 
| workers_autoscaling_group_min_size                  | The minimum size of the AutoScaling Group                              | 
| workers_autoscaling_group_max_size                  | The maximum size of the AutoScaling Group                              | 
| workers_autoscaling_group_desired_capacity          | The number of Amazon EC2 instances that should be running in the group | 
| workers_autoscaling_group_default_cooldown          | Time between a scaling activity and the succeeding scaling activity    | 
| workers_autoscaling_group_health_check_grace_period | Time after instance comes into service before checking health          | 
| workers_autoscaling_group_health_check_type         | `EC2` or `ELB`. Controls how health checking is done                   | 
| workers_security_group_id                           | ID of the worker nodes Security Group                                  | 
| workers_security_group_arn                          | ARN of the worker nodes Security Group                                 | 
| workers_security_group_name                         | Name of the worker nodes Security Group                                | 
| workers_role_arn                                    | ARN of the worker nodes IAM role                                       | 
| workers_role_name                                   | Name of the worker nodes IAM role                                      | 
