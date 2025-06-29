resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support =  true


  tags = merge(        #<-- both default and resource-specific tags 
    var.default_tags,
    {
        Name = "${var.project_name}-vpc"
    }
  )
}



# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-igw"}
  )

}

# PUblic Subnets

resource "aws_subnet" "public" {
  count =  length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-public-subnet-${count.index+1}"}
  )
}


# Private Subnets

resource "aws_subnet" "private" {
  count =  length((var.private_subnets))
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-private-subnet-${count.index+1}"}
  )
}


# NAT Gateway (1 per AZ - Simplified with count = 1 for now)
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-eip"}
  )
}

resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[0].id

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-nat-gw"}
  )
  
}


# Route Tables

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-public-rt"}
  )
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name.id
  }

  tags = merge(
    var.default_tags,
    {Name = "${var.project_name}-private-rt"}
  )
  
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}