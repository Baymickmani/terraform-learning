resource "local_file" "localFile" {
  filename = var.filename
  content  = var.content
}