resource "aws_eip" "lb" {
}

output "eip" {
  value = aws_eip.lb.public_ip
}

output "id" {
  value = aws_eip.lb.id
}

resource "aws_s3_bucket" "mys3" {
  bucket = "devops-project2-s3"
}

output "mys3" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}


resource "aws_instance" "myec2" {
  ami = "ami-03e0b06f01d45a4eb"
  instance_type = "t2.micro"

  tags = {
    Name = "First EC2"
  }
}

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.myec2.id
#   allocation_id = aws_eip.lb.id
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#
#
#   ingress = [
#     {
#       description      = "TLS from VPC"
#       from_port        = 443
#       to_port          = 443
#       protocol         = "tcp"
#       cidr_blocks      = [aws_eip.lb.id/32]
#       ipv6_cidr_blocks = ["::/0"]
#       prefix_list_ids = []
#       security_groups = []
#       selfAttribute   = false
#
#     }
#   ]
#
#   tags = {
#     Name = "allow_tls"
#   }
# }
