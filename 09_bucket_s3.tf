# Create a bucket
resource "aws_s3_bucket" "liberovince" {
  bucket        = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }
  acl = "private"
  tags = {
    Name = "var.bucket_name"
  }
}


resource "aws_s3_bucket_object" "IIS_nuget" {
  for_each   = fileset("data/IIS_nuget_server/", "*.zip")
  bucket     = aws_s3_bucket.liberovince.id
  key        = "IIS_Nuget_Server/${each.value}"
  source     = "data/IIS_nuget_server/${each.value}"
  etag       = filemd5("data/IIS_nuget_server/${each.value}")
  depends_on = [aws_s3_bucket.liberovince]
}


resource "aws_s3_bucket_object" "scripts" {
  for_each   = fileset("data/scripts/", "*.zip")
  bucket     = aws_s3_bucket.liberovince.id
  key        = "scripts/${each.value}"
  source     = "data/scripts/${each.value}"
  etag       = filemd5("data/scripts/${each.value}")
  depends_on = [aws_s3_bucket.liberovince]
}


resource "aws_s3_bucket_object" "Nuget_Nupkg" {
  for_each   = fileset("data/Nuget_Packages/", "*.nupkg")
  bucket     = aws_s3_bucket.liberovince.id
  key        = "Nuget_Packages/Nuget_Nupkg/${each.value}"
  source     = "data/Nuget_Packages/${each.value}"
  etag       = filemd5("data/Nuget_Packages/${each.value}")
  depends_on = [aws_s3_bucket.liberovince]
}

resource "aws_s3_bucket_object" "Nuget_Binaries" {
  for_each   = fileset("data/Nuget_Packages/", "*.zip")
  bucket     = aws_s3_bucket.liberovince.id
  key        = "Nuget_Packages/Nuget_Binaries/${each.value}"
  source     = "data/Nuget_Packages/${each.value}"
  etag       = filemd5("data/Nuget_Packages/${each.value}")
  depends_on = [aws_s3_bucket.liberovince]
}


