resource "aws_rds_cluster" "invo-db" {
  cluster_identifier = "invo-db"
  engine             = "aurora-postgresql"
  engine_mode        = "provisioned"
  engine_version     = "13.6"
  database_name      = "invo-prod"
  master_username    = "admin"
  master_password    = "admin123"
  storage_encrypted  = true

  serverlessv2_scaling_configuration {
    max_capacity = 3.0
    min_capacity = 1.0
  }
}

resource "aws_rds_cluster_instance" "invo" {
  cluster_identifier = aws_rds_cluster.invo-db.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.invo-db.engine
  engine_version     = aws_rds_cluster.invo-db.engine_version
}
