resource "local_file" "simpleFile" {
  filename = "${random_pet.pet.id}.txt"
  content = "Hello.txt"
}

resource "random_pet" "pet2" {
    length = 1
}

resource "random_pet" "pet" {
    length = 1
}