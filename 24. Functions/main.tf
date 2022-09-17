locals {
    prefix = "${var.client_id}+${var.prefix}"
}

resource "aws_instance" "instance" {
    tags {
        Name = "${locals.prefix}_ec2_instance"
    }
}

resource "local_file" "filename" {
    filename = "${locals.prefix}_file.txt"
}