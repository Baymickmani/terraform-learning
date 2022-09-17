variable "name" {
    description = "Dynamo db table name"
    type = string
}

variable "primary_key" {
    description = "Dynamo db table Primary Key"
    type = string
}

variable "primary_key_type" {
    description = "Primary Key Type"
    type = string
}

variable "billing_mode" {
    description = "Billing Mode for Dynamo DB"
    type = string
}