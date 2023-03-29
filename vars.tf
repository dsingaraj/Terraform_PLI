variable "vpc_name"{
    default="terraform_eks_dev_vpc"
    type=string
}

# Network Mask - 255.255.255.0 Addresses Available - 256
variable "vpc_cidr_block"{
    default="10.0.0.0/16"
}

variable "na-region"{
    default="us-west-2"
}
