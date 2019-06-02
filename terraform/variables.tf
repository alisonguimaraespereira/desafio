variable "region" {
  default = "us-west-2"
}

variable "acces_key" {
  default = "AKIA2GZLZETKPUZAO3R4"
}

variable "secret_key" {
  default = "8pyot7N9Ib3Hy87YA1S+RtIXH0pl+qQzfTXYmYlb"
}

variable "ami" {
  default = "ami-0de53d8956e8dcf80"
}

variable "type" {
  default = "t2.micro"
}

variable "ip" {}

variable "mascara" {}

variable "tags" {
  type = "map"

  default = {
    "Name" = "Portal_IdWall"
    "Env"  = "Prod"
  }
}
