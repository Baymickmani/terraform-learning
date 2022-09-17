resource "local_file" "datasource" {
    filename = "hello.txt"
    content = data.local_file.existing.content
}

data "local_file" "existing" {
    filename = "existing.txt"
}