resource "aws_instance" "ec2_instance" {
  ami = "ami-0e63910157459607d"
  instance_type = var.instance_type
  subnet_id = var.subnet
  vpc_security_group_ids = var.ec2_sg
  key_name = "sentrykey.pub"
  associate_public_ip_address = true

  tags = {
    Name = "sentry-ec2-instance"
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = chomp(file(var.ssh_private_key))
      host     = aws_instance.ec2_instance.public_ip
    }
    inline = [
      "sudo apt install python -y"
    ]
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 5;
	  >ec2_instance.ini;
	  echo "[ec2machine]" | tee -a ec2_instance.ini;
	  echo "${aws_instance.ec2_instance.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${var.ssh_private_key}" | tee -a ec2_instance.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
	  ansible-playbook -u ubuntu --private-key ${var.ssh_private_key} -i ec2_instance.ini ${path.module}/playbooks/playbook.yml
    EOT
  }
}

