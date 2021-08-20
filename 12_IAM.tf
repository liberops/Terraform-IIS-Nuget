resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "ec2_s3_profile"
  role = aws_iam_role.ec2_s3_role.name
}


resource "aws_iam_role" "ec2_s3_role" {
  name               = "ec2_s3_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "ec2_s3_policy" {
  name   = "ec2_s3_policy"
  role   = aws_iam_role.ec2_s3_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action":"s3:*" ,
      "Effect":"Allow",
      "Resource":"*"
    },
    {
      "Action":"ec2:CreateTags",
      "Effect":"Allow",
      "Resource": "*"
    }
  
]
}
EOF
}