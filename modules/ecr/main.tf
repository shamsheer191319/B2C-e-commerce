resource "aws_ecr_repository" "ecommerce_repo" {
  name                 = "ecommerce-app"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "ecommerce-app"
  }
}
