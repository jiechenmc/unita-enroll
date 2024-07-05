resource "aws_scheduler_schedule_group" "clinc_schedule_group" {
  name = var.clinc_name
  tags = {
    clinc = var.clinc_name
  }
}
