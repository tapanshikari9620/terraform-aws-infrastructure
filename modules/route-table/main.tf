resource "aws_route_table" "main"{
    vpc_id=var.vpc_id

    tags ={
        name=var.name
    }
}

resource "aws_route" "this"{
    count = var.create_default_route ? 1 : 0
    route_table_id = aws_route_table.main.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
    nat_gateway_id = var.nat_gateway_id
}

resource "aws_route_table_association" "this" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.main.id
}