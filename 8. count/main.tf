resource "local_file" "countFiles" {
  filename = var.filenames[count.index]
  content = "These are created by count argument"
  count = length(var.filenames)
}
