resource "aws_instance" "bastion_server" {
    ami = "ami-0742b4e673072066f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet_1b.id
    vpc_security_group_ids = [
        aws_security_group.inhouse_sg.id
    ]
    tags = {
        Name = "bastion_server"
    }
    key_name = "test-connect-instance"
    associate_public_ip_address = true
}

resource "aws_instance" "private_instance" {
    ami = "ami-0742b4e673072066f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_subnet_1b.id
    vpc_security_group_ids = [
        aws_default_security_group.default_sg.id
    ]
    tags = {
        Name = "private_instance"
    }
    key_name = "test-connect-instance"
}