resource "aws_key_pair" "key_pair" {
  public_key = file("C:/Users/lilik/.ssh/id_rsa.pub")
  key_name = "ssh-key"
}