
//-----------------------------------
// VPC Requirement
//-----------------------------------

variable "custom_vpc" {
  description = "VPC for testing environment"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "it defines the tenancy of VPC. Whether it's defsult or dedicated"
  type        = string
  default     = "default"
}

variable "enable_dns_support"   {
  type = bool
  default = true
}
  variable "enable_dns_hostnames"   {
  type = bool
  default = true
}

//-----------------------------------
// EC2 Requirement
//-----------------------------------

variable "ami_id" {
  description = "ami id"
  type        = string
  default     = "ami-087c17d1fe0178315"
}

variable "instance_type" {
  description = "Instance type to create an instance"
  type        = string
  default     = "t2.micro"
}

variable "ssh_private_key" {
  description = "pem file of Keypair we used to login to EC2 instances"
  type        = string
  default     = "./Keypair-01.pem"
}

//-------------------------
// sg
//-------------------------
variable "sg_ingress_cidr_block"   {
  type = string
  default = "0.0.0.0/0"
}

variable "sg_egress_cidr_block"   {
  type = string
  default = "0.0.0.0/0"
}

//-------------------------------
// rds
//-------------------------------
variable "rds_identifier"   {
  type = string
  default = "mysql"
}
variable "rds_engine"   {
  type = string
  default =  "mysql"
}
variable "rds_engine_version"   {
  type = string
  default = "8.0.15"
}
variable "rds_instance_class"   {
  type = string
  default =  "db.t2.micro"
}
variable "rds_allocated_storage"   {
  type = number
  default = 10
}
variable "rds_storage_encrypted"   {
  type = bool
  default = false  
}   
variable "rds_name"   {
  type = string
  default = "" 
}   
variable "rds_username"   {
  type = string
  default = "admin"
   }   
variable "rds_password"   {
  type = string
  default = "admin"
   }  

variable "rds_port"   {
  type = number
  default = 3306
}
variable "rds_maintenance_window"   {
  type = string
  default = "Mon:00:00-Mon:03:00"
}
variable "rds_backup_window"   {
  type = string
  default = "10:46-11:16"
}
variable "rds_backup_retention_period"   {
  type = number
  default = 1
}
variable "rds_publicly_accessible"   {
  type = bool
  default = false
}
variable "rds_final_snapshot_identifier"   {
  type = string
  default = "lucid-db-snapshot"
}
variable "rds_snapshot_identifier"   {
  type = string
  default = null
}
variable "rds_performance_insights_enabled"   {
  type = bool
  default = true
}