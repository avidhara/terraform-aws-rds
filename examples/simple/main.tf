module "mysql" {
  source                 = "../../"
  create                 = true
  name_prefix            = "test"
  subnet_ids             = data.aws_subnet_ids.this.ids
  family                 = "mysql5.7"
  allocated_storage      = 30
  engine                 = "mysql"
  engine_version         = "5.7"
  identifier             = "terraform"
  instance_class         = "db.t3.micro"
  kms_key_id             = var.kms_key_id
  password               = var.password
  port                   = 3306
  publicly_accessible    = false
  username               = "root"
  vpc_security_group_ids = var.vpc_security_group_ids
}


# module "oracle" {

# }



# module "posgres" {

# }
