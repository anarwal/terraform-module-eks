resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = local.cluster_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
  tags   = local.cluster_tags
}

resource "aws_default_security_group" "vpc_default" {
  vpc_id = aws_vpc.vpc.id
  tags   = { "Name" = "Default Security Group" }
}

resource "aws_nat_gateway" "main" {
  count         = length(var.availability_zones)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  tags          = merge( local.cluster_tags, { "Name"=  format("%s-nat-gw-00%s", module.eks_label.id, count.index)})
}

resource "aws_eip" "nat" {
 count  = length(var.availability_zones)
  vpc   = true
  tags  = merge( local.cluster_tags, { "Name"=  format("%s-nat-gw-eip-00%s", module.eks_label.id, count.index)})
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge( local.public_subnet_tags, { "Name"=  format("%s-public", module.eks_label.id), "Type" = "Public", "Environment" = var.stage })
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
  depends_on             = [aws_route_table.public]
}

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
  depends_on     = [aws_subnet.public, aws_route_table.public]
}

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags                    = merge( local.public_subnet_tags, { "Name" = format("%s-public-%s", module.eks_label.id, element(var.availability_zones, count.index)), "AZ" = element(var.availability_zones, count.index), "Type" = "Public", "Environment" = var.stage})
  lifecycle {
    # Ignore tags added by kops or kubernetes
    ignore_changes = [tags.kubernetes, tags.SubnetType]
  }
}

resource "aws_route_table" "private"{
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id
  tags   = merge( local.private_subnet_tags, { "Name"=  format("%s-private-00%s", module.eks_label.id, count.index), "Type" = "Private", "Environment" = var.stage })
}

resource "aws_route" "private" {
  count                  = length(var.availability_zones)
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.main.*.id, count.index)
  depends_on             = [aws_route_table.private]
}

resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
  depends_on     = [aws_subnet.private, aws_route_table.private]
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags              = merge( local.private_subnet_tags, { "Name" = format("%s-private-%s", module.eks_label.id, element(var.availability_zones, count.index)), "AZ" = element(var.availability_zones, count.index), "Type" = "Private", "Environment" = var.stage})
  lifecycle {
    # Ignore tags added by kops or kubernetes
    ignore_changes = [tags.kubernetes, tags.SubnetType]
  }
}
