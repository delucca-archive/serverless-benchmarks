locals {
  tags = merge(local.networking_tags, module.common.tags)
  networking_tags = {
    Name = var.name
  }
}
