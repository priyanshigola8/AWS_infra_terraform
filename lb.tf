resource "aws_lb_target_group" "my-target-group" {
  name        = "my-test-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = ""
  
  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

}


resource "aws_lb" "terraform-lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  vpc_id = ""
}