resource "aws_internet_gataway" "example" {
    vpc_id = aws_vpc.exemple.id
    tags = {
        Name = "SampleIG"
    }
}
