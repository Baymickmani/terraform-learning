resource "local_file" "provisionerFile" {
  filename = "hello.txt"
  content  = "Hello World"
  provisioner "local-exec" {
    command = "ech 'Hello World'"
    on_failure = continue
  }
}