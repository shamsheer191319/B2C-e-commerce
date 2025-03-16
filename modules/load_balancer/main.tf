resource "aws_lb" "alb" {
  name               = "${var.region}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets           = var.subnets

  tags = {
    Name = "${var.region}-alb"
  }
}
