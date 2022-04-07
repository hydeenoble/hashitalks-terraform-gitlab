variable "bucket" {
  type = string
  description = "(Required) S3 Bucket to which this Public Access Block configuration should be applied."
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
}

variable "block_public_acls" {
  type = bool
  default = true
  description = "Whether Amazon S3 should block public ACLs for this bucket."
}

variable "block_public_policy" {
  type = bool
  default = true
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
}

variable "ignore_public_acls" {
  type = bool
  default = true
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
}

variable "restrict_public_buckets" {
  type = bool
  default = true
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
}
