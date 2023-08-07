resource "random_password" "user" {
  length  = 32
  special = false
}
