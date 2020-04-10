resource "aws_vpc" "serverless_benchmark" {
  cidr_block = var.cidr_blocks.vpc
  tags = local.tags
}

resource "aws_subnet" "serverless_benchmark" {
  vpc_id = aws_vpc.serverless_benchmark.id
  count = var.subnet_count
  tags = local.tags

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = format(var.cidr_blocks.subnet, count.index)
}

resource "aws_internet_gateway" "serverless_benchmark" {
  vpc_id = aws_vpc.serverless_benchmark.id
  tags = local.tags
}

resource "aws_route_table" "serverless_benchmark" {
  vpc_id = aws_vpc.serverless_benchmark.id
  tags = local.tags

  route {
    cidr_block = var.cidr_blocks.route_table
    gateway_id = aws_internet_gateway.serverless_benchmark.id
  }
}

resource "aws_route_table_association" "serverless_benchmark" {
  count = var.subnet_count
  subnet_id      = aws_subnet.serverless_benchmark.*.id[count.index]
  route_table_id = aws_route_table.serverless_benchmark.id
}
