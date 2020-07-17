resource "aws_elb" "elb" {
  name                        = "Elastic-load-balancer"
  subnets                     = [var.subnet_id]
  security_groups             = [aws_security_group.elb.id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = 400
  connection_draining         = var.connection_draining
  connection_draining_timeout = 400
  internal                    = var.internal

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = format("%s_elb", var.environment)
  }
}
