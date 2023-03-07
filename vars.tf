variable "instances" {
  default = {
    catalogue = {
      name = "catalogue"
      type = "t3.micro"
      password = ""
    }
    frontend      = {
      name = "frontend"
      type = "t2.micro"
      password = ""
    }
    user      = {
      name = "user"
      type = "t2.micro"
      password = ""
    }
    cart      = {
      name = "cart"
      type = "t2.micro"
      password = ""
    }
    mongodb      = {
      name = "mongodb"
      type = "t2.micro"
      password = ""
    }
    mysql      = {
      name = "mysql"
      type = "t2.micro"
      password = "RoboShop@1"
    }
    rabbitmq      = {
      name = "rabbitmq"
      type = "t2.micro"
      password = "roboshop123"
    }
    redis      = {
      name = "redis"
      type = "t2.micro"
      password = ""
    }
    shipping      = {
      name = "shipping"
      type = "t2.micro"
      password = "RoboShop@1"
    }
    payment      = {
      name = "payment"
      type = "t2.micro"
      password = "roboshop123"
    }
  }

}
