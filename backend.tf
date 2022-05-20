terraform {
 backend "s3" {
     bucket = "mojec-tf-backend"
     key    = "mojec/state/backup"
     region = "eu-west-1"
   }
 }
