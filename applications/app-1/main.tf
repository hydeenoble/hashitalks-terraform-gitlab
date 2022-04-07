module "s3" {
  source              = "../../modules/s3"

  bucket = "${local.application}-${terraform.workspace}"
  tags = var.tags
}