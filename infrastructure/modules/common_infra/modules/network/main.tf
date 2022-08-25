
resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr
    tags = merge(
        {
            Name = var.name
        },
        var.vpc_tags,
        var.tags
    )
}

resource "aws_subnet" "public" {
    count = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
    vpc_id     = aws_vpc.this.id
    cidr_block = element(concat(var.public_subnets, [""]), count.index)
    availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : null
    map_public_ip_on_launch = true

    tags = merge(
        {
            "Name" = format(
                "${var.name}-public-%s",
                element(var.azs, count.index),
            )
        },
        var.public_subnet_tags,
        var.tags
    )
}

resource "aws_subnet" "private" {
    count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0
    vpc_id     = aws_vpc.this.id
    cidr_block = element(concat(var.private_subnets, [""]), count.index)
    availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : null

    tags = merge(
        {
            "Name" = format(
                "${var.name}-private-%s",
                element(var.azs, count.index),
            )
        },
        var.private_subnet_tags,
        var.tags
    )
}

resource "aws_subnet" "database" {
    count = length(var.database_subnets) > 0 ? length(var.database_subnets) : 0
    vpc_id     = aws_vpc.this.id
    cidr_block = element(concat(var.database_subnets, [""]), count.index)
    availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : null
    tags = merge(
        {
            "Name" = format(
                "${var.name}-database-%s",
                element(var.azs, count.index),
            )
        },
        var.database_subnet_tags,
        var.tags
    )
}

resource "aws_internet_gateway" "this" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "${var.name}-igw" },
    var.tags,
    var.igw_tags,
  )
}

resource "aws_route_table" "public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    { "Name" = "${var.name}-public" },
    var.tags,
    var.public_route_table_tags,
  )
}

resource "aws_route" "public_internet_gateway" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  subnet_id = element(aws_subnet.public[*].id, count.index)
  route_table_id = element(
    aws_route_table.public[*].id, count.index
  )
}

resource "aws_route_table" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = format("${var.name}-private-%s", element(var.azs, count.index)) 
    },
    var.tags,
    var.private_route_table_tags,
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  subnet_id = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(
    aws_route_table.private[*].id, count.index
  )
}

resource "aws_route" "private_nat_gateway" {
  count =  length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this[*].id, count.index)

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table" "database" {
  count = length(var.database_subnets) > 0 ? length(var.database_subnets) : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = format("${var.name}-database-%s", element(var.azs, count.index)) 
    },
    var.tags,
    var.database_route_table_tags,
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnets) > 0 ? length(var.database_subnets) : 0

  subnet_id = element(aws_subnet.database[*].id, count.index)
  route_table_id = element(
    aws_route_table.database[*].id, count.index
  )
}

resource "aws_eip" "nat" {
  count = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  vpc = true
  tags = merge(
    {
      "Name" = format(
        "${var.name}-%s", count.index
      )
    },
    var.tags,
    var.nat_eip_tags,
  )
}

resource "aws_nat_gateway" "this" {
  count = length(var.public_subnets) > 0 && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  allocation_id = element(aws_eip.nat[*].id, count.index)
  subnet_id = element(
    aws_subnet.public[*].id, count.index
  )

  tags = merge(
    {
      "Name" = format(
        "${var.name}-%s", count.index
      )
    },
    var.tags,
    var.nat_gateway_tags,
  )

  depends_on = [aws_internet_gateway.this]
}