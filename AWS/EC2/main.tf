resource "aws_key_pair" "" {
  key_name   = var.infra.aws_key_pair_name
  public_key = file(var.infra.aws_key_pair_path)
}

resource "aws_instance" "" {
  ami           = var.infra.ami_id
  instance_type = var.infra.instance_type
  key_name      = aws_key_pair.example.key_name
  subnet_id     = var.infra.subnet_id
  vpc_security_group_ids = var.infra.vpc_security_group_ids
  count        = 1
  tags = var.tags
}