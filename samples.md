#   Exemplos de código Terraform

##  Iteração para criar n recursos

```tf
variable "users" {
  type    = set(string)
  default = ["user1", "user2", "user3"]
}

resource "aws_iam_user" "user" {
  for_each = var.users
  name     = each.value
}
```

##  upper e Lower

```tf
variable "environment" {
  type    = string
  default = "Production"
}

output "env_uppercase" {
  value = upper(var.environment)  # Resultado: "PRODUCTION"
}

output "env_lowercase" {
  value = lower(var.environment)  # Resultado: "production"
}
```

##  Construção de objetos reutilizáveis

```tf
variable "instance_config" {
  type = map(string)
  default = {
    instance_type = "t2.micro"
    ami_id        = "ami-0abcdef1234567890"
  }
}

resource "aws_instance" "example" {
  instance_type = var.instance_config["instance_type"]
  ami           = var.instance_config["ami_id"]
}
```

##  Construção de arrays

```tfvariable "security_groups" {
  type    = list(string)
  default = ["sg-12345678", "sg-87654321"]
}

resource "aws_instance" "example" {
  # ... outras configurações ...

  vpc_security_group_ids = var.security_groups
}
```

##  Aplicar e destruir com arquivos de ambiente

```bash
terraform destroy -var-file="<file>.tfvars" -auto-approve
```

```bash
terraform plan -var-file="<file>.tfvars"
terraform apply -var-file="<file>.tfvars" -auto-approve
```

##  Estrutura adequada

- Cada pasta de recursos deve declarar os arquivos `local`, `variables`
- terraform init && terraform plan -var-file="qa.auto.tfvars" && terraform apply -var-file="qa.auto.tfvars" -auto-approve