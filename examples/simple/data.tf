data "aws_subnet_ids" "this" {
  vpc_id = "vpc-0318dd66ddac0a2f3"

  filter {
    name   = "tag:Name"
    values = ["Public subnet-1", "public-subnet-2"]
  }

}
