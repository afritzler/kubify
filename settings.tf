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

#
# lbaas settings
#

module "use_lbaas" {
  source = "modules/flag"
  option = "${var.use_lbaas}"
}
module "omit_lbaas" {
  source = "modules/flag"
  option = "${var.omit_lbaas}"
}
module "provide_lbaas" {
  source = "modules/variable"
  value = "${module.use_lbaas.flag && ! module.omit_lbaas.flag ? 1 : 0}"
}

module "vip_nginx" {
  source = "modules/variable"
  value = "${module.worker.lbaas_address}"
}
module "vip_type_nginx" {
  source = "modules/variable"
  value = "${module.worker.lbaas_address_type}"
}

module "vip_apiserver" {
  source = "modules/variable"
  value = "${module.master.lbaas_address}"
}
module "vip_type_apiserver" {
  source = "modules/variable"
  value = "${module.master.lbaas_address_type}"
}

#
# bastion
#

module "use_bastion" {
  source = "modules/flag"
  option = "${var.use_bastion}"
}

module "bastion_user" {
  source = "modules/variable"
  value = "${module.use_bastion.flag ? var.bastion_user : "core"}"
}
module "bastion_host" {
  source = "modules/variable"
#  value = "${element(compact(concat(list(module.iaas.bastion),module.master.fips)),0)}"
  value = "${module.use_bastion.flag ? module.iaas.bastion : element(concat(module.master.fips,list("none")),0)}"
}

output "bastion" {
  value = "${module.bastion_host.value}"
}
output "bastion_user" {
  value = "${module.bastion_user.value}"
}

