parameters = [
  { name = "dev.frontend.catalogue_url", type = "String", value = "http://catalogue-dev.shujadevops.online:8080/"},
  { name = "dev.frontend.user_url", type = "String", value = "http://user-dev.shujadevops.online:8080/"},
  { name = "dev.frontend.cart_url", type = "String", value = "http://cart-dev.shujadevops.online:8080/"},
  { name = "dev.frontend.payment_url", type = "String", value = "http://payment-dev.shujadevops.online:8080/"},
  { name = "dev.frontend.shipping_url", type = "String", value = "http://shipping-dev.shujadevops.online:8080/"},
  { name = "dev.user.mongo", type = "String", value = "true"},
  { name = "dev.user.redis_host", type = "String", value = "redis-dev.shujadevops.online"},
  { name = "dev.user.mongo_url", type = "String", value = "mongodb://mongodb-dev.shujadevops.online:27017/catalogue"},
  { name = "dev.shipping.cart_endpoint", type = "String", value = "cart-dev.shujadevops.online:8080"},
  { name = "dev.shipping.db_host", type = "String", value = "mysql-dev.shujadevops.online"},
  { name = "dev.payment.cart_host", type = "String", value = "cart-dev.shujadevops.online"},
  { name = "dev.payment.cart_port", type = "String", value = "8080"},
  { name = "dev.payment.user_host", type = "String", value = "user-dev.shujadevops.online"},
  { name = "dev.payment.user_port", type = "String", value = "8080"},
  { name = "dev.payment.amq_host", type = "String", value = "rabbitmq-dev.shujadevops.online"},
  { name = "dev.catalogue.mongo", type = "String", value = "true"},
  { name = "dev.catalogue.mongo_url", type = "String", value = "mongodb://mongodb-dev.shujadevops.online:27017/users"},
  { name = "dev.cart.redis_host", type = "String", value = "redis-dev.shujadevops.online"},
  { name = "dev.cart.catalogue_host", type = "String", value = "catalogue-dev.shujadevops.online"},
  { name = "dev.cart.catalogue_port", type = "String", value = "8080"}
]
secrets = [
   { name = "dev.mysql.password", type = "SecureString", value = "RoboShop@1"},
  { name = "dev.payment.amq_user", type = "SecureString", value = "roboshop"},
  { name = "dev.payment.amq_pass", type = "SecureString", value = "roboshop123"},
  { name = "dev.rabbitmq.amq_user", type = "SecureString", value = "roboshop123"},
  { name = "dev.rabbitmq.amq_pass", type = "SecureString", value = "roboshop123"},

]

