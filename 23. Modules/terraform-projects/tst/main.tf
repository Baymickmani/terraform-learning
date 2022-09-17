module "tstModule" {
    source = "../childModules"
    filename = "tst.txt"
    content = "This is crseated by test environment"
}

module {
    source = "github.com/childmodules/s3.tf"
}
module {
    source = "github.com/childmodules/dynamodb.tf"
}

module {
    source = "github.com/childmodules/s3.tf"
}
module {
    source = "github.com/childmodules/ec2.tf"
}
module {
    source = "github.com/childmodules/dynamodb.tf"
}
