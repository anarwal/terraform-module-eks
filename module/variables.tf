variable "availability_zones" {
  type        = list
  description = "List of availability zones"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev' or 'testing'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'cluster'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "instance_type" {
  type        = string
  description = "Instance type to launch"
  default     = "t2.small"
}

variable "kubernetes_version" {
  type        = string
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used"
}

variable "health_check_type" {
  type        = string
  description = "Controls how health checking is done. Valid values are `EC2` or `ELB`"
  default      = "EC2"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address with an instance in a VPC"
  default     = true
}

variable "eks_workers_asg_max_size" {
  type        = number
  description = "The maximum size of the AutoScaling Group"
}

variable "eks_workers_asg_min_size" {
  type        = number
  description = "The minimum size of the AutoScaling Group"
}

variable "wait_for_capacity_timeout" {
  type        = string
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to '0' causes Terraform to skip all Capacity Waiting behavior"
  default     = "10m"
}

variable "autoscaling_policies_enabled" {
  type        = bool
  description = "Whether to create `aws_autoscaling_policy` and `aws_cloudwatch_metric_alarm` resources to control Auto Scaling"
  default     = true
}

variable "cpu_utilization_high_threshold_percent" {
  type        = number
  description = "Worker nodes AutoScaling Group CPU utilization high threshold percent"
  default     = 80
}

variable "cpu_utilization_low_threshold_percent" {
  type        = number
  description = "Worker nodes AutoScaling Group CPU utilization low threshold percent"
  default     = 20
}

variable "kubeconfig_path" {
  type        = string
  description = "The path to `kubeconfig` file"
  default     = "~/.kube/config"
}

variable "region" {
  type        = string
  description = "AWS Region"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnets" {
  type        = list
  description = "List of private subnets (Value needs to be in CIDR Block range)"
}

variable "public_subnets" {
  type        = list
  description = "List of public subnets (Value needs to be in CIDR Block range)"
}

variable "install_aws_cli" {
  type        = bool
  default     = false
  description = "Set to `true` to install AWS CLI if the module is provisioned on workstations where AWS CLI is not installed by default, e.g. Terraform Cloud workers"
}

variable "install_kubectl" {
  type        = bool
  default     = false
  description = "Set to `true` to install `kubectl` if the module is provisioned on workstations where `kubectl` is not installed by default, e.g. Terraform Cloud workers"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH Key name to connect to worker node"
}
