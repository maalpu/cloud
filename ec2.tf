# OPCION 3 Usando for_each y toset( lista )
variable "instancias" {
  type = list(string)
  # default = ["mysql", "jumpserver"]
  default = ["apache"]
}

resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "nomtoring_instance" {
  # count                  = var.enable_monitoring ? 1 : 0
  # count                  = var.enable_monitoring == 1 ? 1 : 0
  count                  = var.enable_monitoring != 0 ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")

  tags = {
    "Name" = "monitoreo-${local.sufix}"
  }
}

# OPCION 2 Usando for_each y set
# variable "instancias" {
#   type    = set(string)
#   default = ["apache", "mysql", "jumpserver"]
# }

# resource "aws_instance" "public_instance" {
#   for_each               = var.instancias
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data              = file("scripts/userdata.sh")

#   tags = {
#     "Name" = each.value
#   }
# }


# OPCION 2 Usando count y list
# variable "instancias" {
#   type    = list(string)
#   default = ["apache", "mysql", "jumpserver"]
# }

# resource "aws_instance" "public_instance" {
#   count                  = length(var.instancias)
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data              = file("scripts/userdata.sh")

#   tags = {
#     "Name" = var.instancias[count.index]
#   }
# }
