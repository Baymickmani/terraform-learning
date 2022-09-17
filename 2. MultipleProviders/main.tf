resource "random_password" "dbPassword" {
    length = 5
}

resource "random_pet" "petName" {
    length = 1
}

resource "local_file" "petFile" {
    filename = "${random_pet.petName.id}.txt" 
    content = "This is a pet file"
}