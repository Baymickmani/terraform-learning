module "devModule" {
    source = "../childModules"
    filename = "dev.txt"
    content = "this file is created by dev environment"
}