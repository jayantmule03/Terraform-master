resource "aws_instance" "nginx-server" {
     ami = "ami-084568db4383264d4"
     instance_type = "t2.micro"
     vpc_security_group_ids = [aws_security_group.my-sg.id]
     subnet_id = aws_subnet.public-subnet.id
     associate_public_ip_address = true

      user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install nginx -y
            sudo systemctl start nginx
            sudo systemctl enable nginx
            EOF

           tags = {
             Name = "NginxServer"
            }
  
}