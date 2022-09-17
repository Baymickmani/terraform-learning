data "local_file" "file" {
    filename = "Hello.txt"
}

resource "local_file" "createdFile" {
    filename = data.local_file.file.content
    content = "This is a created file"
}