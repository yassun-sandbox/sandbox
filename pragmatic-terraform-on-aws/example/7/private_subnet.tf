resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.193.0/26"
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "SamplePrivateSubnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
}

# nat gateway
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  nat_gateway_id         = aws_nat_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
