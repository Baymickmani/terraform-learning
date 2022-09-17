resource "local_file" "foreachfiles" {
  for_each = var.filenames
  filename = each.value
  content = "this is a file"
}