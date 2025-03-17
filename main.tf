resource "aws_instance" "k3s_server" {
  ami           = "ami-05c179eced2eb9b5b"
  instance_type = "t3.small"

  key_name      = "N.V_key" # Replace with your key pair
  security_groups = [aws_security_group.k3s_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    set -e
    sudo yum update -y
    curl -sfL https://get.k3s.io | sh -
  EOF

  tags = {
    Name = "K3sServer"
  }
}
