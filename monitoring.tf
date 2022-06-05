

//-----------------------------------
// Creating VPC FlowLogs:
//-----------------------------------

resource "aws_flow_log" "vpc_flow_log" {
  # iam_role_arn         = data.aws_iam_role.iam_role.arn
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.cloudwatch_log_group.arn
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.custom_vpc.id
}

//-----------------------------------
// Creating CloudWatch Log Group:
//-----------------------------------

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = "VPC-FlowLogs-Group"
  retention_in_days = 30
}