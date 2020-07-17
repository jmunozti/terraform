resource "aws_elb" "elb" {
  name                      = "Elastic-load-balancer"
  subnets                   = [var.subnet_id]
  security_groups           = [aws_security_group.elb.id]
  cross_zone_load_balancing = var.cross_zone_load_balancing
  internal                  = var.internal

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Name = format("%s_elb", var.environment)
  }
}
