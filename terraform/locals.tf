locals {
  num_azs = length(data.aws_availability_zones.available.names)
}
