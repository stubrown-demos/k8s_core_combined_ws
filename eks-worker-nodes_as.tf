resource "aws_iam_policy" "autoscale" {
  name        = "autoscale"
  path        = "/"
  description = "autoscale policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribeAutoScalingInstances",
                "autoscaling:DescribeLaunchConfigurations",
                "autoscaling:DescribeTags",
                "autoscaling:SetDesiredCapacity",
                "autoscaling:TerminateInstanceInAutoScalingGroup"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "demo-node-Autoscaling" {
  policy_arn = "${aws_iam_policy.autoscale.arn}"
  role       = "${aws_iam_role.demo-node.name}"
}

