resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.192.0/26"
  map_public_ip_on_launch = true # 自動でIPを付与する
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "SamplePublicSubnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}

# internet gateway
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.example.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


