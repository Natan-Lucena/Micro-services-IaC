resource "aws_key_pair" "aws_ssh_key" {
  key_name   = "aws_ssh_key"
  public_key = file(var.public_key_path)
}