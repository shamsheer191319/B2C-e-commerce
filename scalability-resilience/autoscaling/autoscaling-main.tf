resource "aws_autoscaling_group" "k8s_nodes" {
  name                 = "K8sNodeAutoScalingGroup"
  min_size             = 2
  max_size             = 10
  desired_capacity     = 3
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.k8s_nodes.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "k8s-node"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "ScaleUpPolicy"
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.k8s_nodes.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "ScaleDownPolicy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name = aws_autoscaling_group.k8s_nodes.name
}
