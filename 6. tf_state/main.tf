resource "local_file" "sampleFile" {
  filename = "xyt.txt"
  content  = "some content 1"
  lifecycle {
    ignore_changes = all
  }
}
