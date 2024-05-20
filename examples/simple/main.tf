resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "postgres" {
  source = "../../"
  create = true


  subnet_ids                  = ["subnet-xxx", "subnet-xxx"]
  create_parameter_group_name = true
  family                      = "postgres15"
  parameters = [
    {
      name         = "rds.force_ssl"
      value        = "1"
      apply_method = "immediate"
    }
  ]
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.5"
  identifier             = "test-db"
  password               = random_password.password.result
  port                   = "5432"
  username               = "testuser"
  vpc_security_group_ids = ["sg-xxx"]
  instance_class         = "db.t3.micro"
  tags = {
    Name = "test-db"
  }
}
