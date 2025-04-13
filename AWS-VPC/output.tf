output "name" {
  value = aws_subnet.public-subnet.availability_zone_id
}
output "name1" {
  value = aws_subnet.private-subnet.availability_zone_id
}