vpc_cidr_block = "10.0.0.0/16"
sub_cidr_block_pub = {
    dev = "10.0.2.0/24"
    stg = "10.0.4.0/24"
    prod = "10.0.6.0/24"
}

sub_cidr_block_priv = {
    dev = "10.0.1.0/24"
    stg = "10.0.3.0/24"
    prod = "10.0.5.0/24"
}

rds_sub_cidr = {
    dev = "10.0.7.0/24"
    prod = "10.0.9.0/24"
}

zone_1 = {
    dev = "10.0.10.0/24"
    # stg = "10.0.4.0/24"
    prod = "10.0.11.0/24"
}

zone_2 = {
    dev = "10.0.12.0/24"
    # stg = "10.0.4.0/24"
    prod = "10.0.13.0/24"
}

instance-type-fe = {
    dev = "t3.small"
    stg = "t3.medium"
    prod = "t3.medium"
}

instance-type-be = {
    dev = "t3.medium"
    stg = "t3.medium"
    prod = "t3.medium"
}

instance-type-rds = {
    dev = "db.t3.medium"
    stg = "db.t3.medium"
    prod = "db.t3.medium"
}

ami-image = "ami-02157887724ade8ba"