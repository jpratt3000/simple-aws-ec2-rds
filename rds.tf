locals {
  resource_name_prefix = "lucid-simple"
  tags={
    Env = "Demo"
  }
}

resource "aws_db_subnet_group" "_" {
  name       = "${local.resource_name_prefix}-db-subnet-group"
  subnet_ids = aws_subnet.public_subnet.*.id
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.4.0"

  identifier =  "${local.resource_name_prefix}-db"

  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = "mysql"
  engine_version       = "8.0.27"
  family               = "mysql8.0" # DB parameter group
  major_engine_version = "8.0"      # DB option group
  instance_class       = "db.t4g.large"

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "lucidMysql"
  username = "lucid_mysql"
  port     = 3306

  multi_az               = true
  subnet_ids             = ["${aws_db_subnet_group._.id}"]
  vpc_security_group_ids = ["${aws_security_group._.id}"]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = local.tags
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}


# resource "aws_db_instance" "_" {
#   identifier = "${local.resource_name_prefix}-db"

#   allocated_storage       = var.rds_allocated_storage
#   backup_retention_period = var.rds_backup_retention_period
#   backup_window           = var.rds_backup_window
#   maintenance_window      = var.rds_maintenance_window
#   db_subnet_group_name    = aws_db_subnet_group._.id
#   engine                  = var.rds_engine
#   engine_version          = var.rds_engine_version
#   instance_class          = var.rds_instance_class
#   multi_az                = true
#   name                    = var.rds_name
#   username                = var.rds_username
#   password                = var.rds_password
#   port                    = var.rds_port
#   publicly_accessible     = var.rds_publicly_accessible
#   storage_encrypted       = var.rds_storage_encrypted
#   storage_type            = var.rds_storage_type

#   vpc_security_group_ids = ["${aws_security_group._.id}"]

#   allow_major_version_upgrade = var.rds_allow_major_version_upgrade
#   auto_minor_version_upgrade  = var.rds_auto_minor_version_upgrade

#   final_snapshot_identifier = var.rds_final_snapshot_identifier
#   snapshot_identifier       = var.rds_snapshot_identifier
#   skip_final_snapshot       = var.rds_skip_final_snapshot

#   performance_insights_enabled = var.rds_performance_insights_enabled
# }