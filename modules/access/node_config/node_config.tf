# Copyright 2017 The Gardener Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

##############################################################################
# node config handling
# generated by create.sh based on local variables.tf
##############################################################################

#
# specify config map to unpack settings into output
#
variable "defaults" {
  type = "map"
  default = {
  }
}
variable "node_config" {
  type = "map"
  default = { }
}

#
# or specify variables according to variables.tf to
# pack a config map
#

locals {
  info = "${merge(var.defaults,var.node_config)}"

  count = "${var.count == "" ? lookup(local.info,"count",var.count) : var.count}"
  image_name = "${var.image_name == "" ? lookup(local.info,"image_name",var.image_name) : var.image_name}"
  flavor_name = "${var.flavor_name == "" ? lookup(local.info,"flavor_name",var.flavor_name) : var.flavor_name}"
  update_mode = "${var.update_mode == "" ? lookup(local.info,"update_mode",var.update_mode) : var.update_mode}"
  generation = "${var.generation == "" ? lookup(local.info,"generation",var.generation) : var.generation}"
  assign_fips = "${var.assign_fips == "" ? lookup(local.info,"assign_fips",var.assign_fips) : var.assign_fips}"
  volume_size = "${var.volume_size == "" ? lookup(local.info,"volume_size",var.volume_size) : var.volume_size}"
}


output "node_config" {
  value = {
      count = "${local.count}"
      image_name = "${local.image_name}"
      flavor_name = "${local.flavor_name}"
      update_mode = "${local.update_mode}"
      generation = "${local.generation}"
      assign_fips = "${local.assign_fips}"
      volume_size = "${local.volume_size}"
  }
}

#
# always provide all settings as dedicated output
#
output "count" {
  value = "${local.count}"
}
output "image_name" {
  value = "${local.image_name}"
}
output "flavor_name" {
  value = "${local.flavor_name}"
}
output "update_mode" {
  value = "${local.update_mode}"
}
output "generation" {
  value = "${local.generation}"
}
output "assign_fips" {
  value = "${local.assign_fips}"
}
output "volume_size" {
  value = "${local.volume_size}"
}
