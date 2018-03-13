
#
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
# version configuration handling
# pack or unpack version variables
# generated by create.sh based on variables.tf
##############################################################################

#
# specify config map to unpack settings into output
#
variable "versions" {
  type = "map"
  default = { }
}

#
# or specify variables according to variables.tf to
# pack a config map
#

module "image_name" {
  source="../defaults"
  optional = true
  values=[ "${var.image_name}","${lookup(var.versions,"image_name","")}", "${local.image_name}" ]
}
module "bastion_image_name" {
  source="../defaults"
  optional = true
  values=[ "${var.bastion_image_name}","${lookup(var.versions,"bastion_image_name","")}", "${local.bastion_image_name}" ]
}
module "kubernetes_version" {
  source="../defaults"
  optional = true
  values=[ "${var.kubernetes_version}","${lookup(var.versions,"kubernetes_version","")}", "${local.kubernetes_version}" ]
}
module "dns_version" {
  source="../defaults"
  optional = true
  values=[ "${var.dns_version}","${lookup(var.versions,"dns_version","")}", "${local.dns_version}" ]
}
module "flannel_version" {
  source="../defaults"
  optional = true
  values=[ "${var.flannel_version}","${lookup(var.versions,"flannel_version","")}", "${local.flannel_version}" ]
}
module "cni_version" {
  source="../defaults"
  optional = true
  values=[ "${var.cni_version}","${lookup(var.versions,"cni_version","")}", "${local.cni_version}" ]
}
module "etcd_version" {
  source="../defaults"
  optional = true
  values=[ "${var.etcd_version}","${lookup(var.versions,"etcd_version","")}", "${local.etcd_version}" ]
}
module "etcd_operator_version" {
  source="../defaults"
  optional = true
  values=[ "${var.etcd_operator_version}","${lookup(var.versions,"etcd_operator_version","")}", "${local.etcd_operator_version}" ]
}
module "bootkube_version" {
  source="../defaults"
  optional = true
  values=[ "${var.bootkube_version}","${lookup(var.versions,"bootkube_version","")}", "${local.bootkube_version}" ]
}
module "kubernetes_hyperkube" {
  source="../defaults"
  optional = true
  values=[ "${var.kubernetes_hyperkube}","${lookup(var.versions,"kubernetes_hyperkube","")}", "${local.kubernetes_hyperkube}" ]
}
module "bootkube" {
  source="../defaults"
  optional = true
  values=[ "${var.bootkube}","${lookup(var.versions,"bootkube","")}", "${local.bootkube}" ]
}
module "kubernetes_hyperkube_patch" {
  source="../defaults"
  optional = true
  values=[ "${var.kubernetes_hyperkube_patch}","${lookup(var.versions,"kubernetes_hyperkube_patch","")}", "${local.kubernetes_hyperkube_patch}" ]
}
module "nginx_version" {
  source="../defaults"
  optional = true
  values=[ "${var.nginx_version}","${lookup(var.versions,"nginx_version","")}", "${local.nginx_version}" ]
}
module "lego_version" {
  source="../defaults"
  optional = true
  values=[ "${var.lego_version}","${lookup(var.versions,"lego_version","")}", "${local.lego_version}" ]
}
module "dex_version" {
  source="../defaults"
  optional = true
  values=[ "${var.dex_version}","${lookup(var.versions,"dex_version","")}", "${local.dex_version}" ]
}
module "garden_apiserver_image" {
  source="../defaults"
  optional = true
  values=[ "${var.garden_apiserver_image}","${lookup(var.versions,"garden_apiserver_image","")}", "${local.garden_apiserver_image}" ]
}
module "garden_apiserver_version" {
  source="../defaults"
  optional = true
  values=[ "${var.garden_apiserver_version}","${lookup(var.versions,"garden_apiserver_version","")}", "${local.garden_apiserver_version}" ]
}
module "garden_controller_image" {
  source="../defaults"
  optional = true
  values=[ "${var.garden_controller_image}","${lookup(var.versions,"garden_controller_image","")}", "${local.garden_controller_image}" ]
}
module "garden_controller_version" {
  source="../defaults"
  optional = true
  values=[ "${var.garden_controller_version}","${lookup(var.versions,"garden_controller_version","")}", "${local.garden_controller_version}" ]
}
module "external_dns_image" {
  source="../defaults"
  optional = true
  values=[ "${var.external_dns_image}","${lookup(var.versions,"external_dns_image","")}", "${local.external_dns_image}" ]
}
module "external_dns_version" {
  source="../defaults"
  optional = true
  values=[ "${var.external_dns_version}","${lookup(var.versions,"external_dns_version","")}", "${local.external_dns_version}" ]
}
module "machine_controller_image" {
  source="../defaults"
  optional = true
  values=[ "${var.machine_controller_image}","${lookup(var.versions,"machine_controller_image","")}", "${local.machine_controller_image}" ]
}
module "machine_controller_version" {
  source="../defaults"
  optional = true
  values=[ "${var.machine_controller_version}","${lookup(var.versions,"machine_controller_version","")}", "${local.machine_controller_version}" ]
}
module "tiller_image" {
  source="../defaults"
  optional = true
  values=[ "${var.tiller_image}","${lookup(var.versions,"tiller_image","")}", "${local.tiller_image}" ]
}
module "tiller_version" {
  source="../defaults"
  optional = true
  values=[ "${var.tiller_version}","${lookup(var.versions,"tiller_version","")}", "${local.tiller_version}" ]
}
module "helm_image" {
  source="../defaults"
  optional = true
  values=[ "${var.helm_image}","${lookup(var.versions,"helm_image","")}", "${local.helm_image}" ]
}
module "helm_version" {
  source="../defaults"
  optional = true
  values=[ "${var.helm_version}","${lookup(var.versions,"helm_version","")}", "${local.helm_version}" ]
}

#
# always provide a config map value
#

output "versions" {
  value = {
      image_name = "${module.image_name.value}"
      bastion_image_name = "${module.bastion_image_name.value}"
      kubernetes_version = "${module.kubernetes_version.value}"
      dns_version = "${module.dns_version.value}"
      flannel_version = "${module.flannel_version.value}"
      cni_version = "${module.cni_version.value}"
      etcd_version = "${module.etcd_version.value}"
      etcd_operator_version = "${module.etcd_operator_version.value}"
      bootkube_version = "${module.bootkube_version.value}"
      kubernetes_hyperkube = "${module.kubernetes_hyperkube.value}"
      bootkube = "${module.bootkube.value}"
      kubernetes_hyperkube_patch = "${module.kubernetes_hyperkube_patch.value}"
      nginx_version = "${module.nginx_version.value}"
      lego_version = "${module.lego_version.value}"
      dex_version = "${module.dex_version.value}"
      garden_apiserver_image = "${module.garden_apiserver_image.value}"
      garden_apiserver_version = "${module.garden_apiserver_version.value}"
      garden_controller_image = "${module.garden_controller_image.value}"
      garden_controller_version = "${module.garden_controller_version.value}"
      external_dns_image = "${module.external_dns_image.value}"
      external_dns_version = "${module.external_dns_version.value}"
      machine_controller_image = "${module.machine_controller_image.value}"
      machine_controller_version = "${module.machine_controller_version.value}"
      tiller_image = "${module.tiller_image.value}"
      tiller_version = "${module.tiller_version.value}"
      helm_image = "${module.helm_image.value}"
      helm_version = "${module.helm_version.value}"
  }
}

#
# always provide all settings as dedicated output
#
output "image_name" {
  value = "${module.image_name.value}"
}
output "bastion_image_name" {
  value = "${module.bastion_image_name.value}"
}
output "kubernetes_version" {
  value = "${module.kubernetes_version.value}"
}
output "dns_version" {
  value = "${module.dns_version.value}"
}
output "flannel_version" {
  value = "${module.flannel_version.value}"
}
output "cni_version" {
  value = "${module.cni_version.value}"
}
output "etcd_version" {
  value = "${module.etcd_version.value}"
}
output "etcd_operator_version" {
  value = "${module.etcd_operator_version.value}"
}
output "bootkube_version" {
  value = "${module.bootkube_version.value}"
}
output "kubernetes_hyperkube" {
  value = "${module.kubernetes_hyperkube.value}"
}
output "bootkube" {
  value = "${module.bootkube.value}"
}
output "kubernetes_hyperkube_patch" {
  value = "${module.kubernetes_hyperkube_patch.value}"
}
output "nginx_version" {
  value = "${module.nginx_version.value}"
}
output "lego_version" {
  value = "${module.lego_version.value}"
}
output "dex_version" {
  value = "${module.dex_version.value}"
}
output "garden_apiserver_image" {
  value = "${module.garden_apiserver_image.value}"
}
output "garden_apiserver_version" {
  value = "${module.garden_apiserver_version.value}"
}
output "garden_controller_image" {
  value = "${module.garden_controller_image.value}"
}
output "garden_controller_version" {
  value = "${module.garden_controller_version.value}"
}
output "external_dns_image" {
  value = "${module.external_dns_image.value}"
}
output "external_dns_version" {
  value = "${module.external_dns_version.value}"
}
output "machine_controller_image" {
  value = "${module.machine_controller_image.value}"
}
output "machine_controller_version" {
  value = "${module.machine_controller_version.value}"
}
output "tiller_image" {
  value = "${module.tiller_image.value}"
}
output "tiller_version" {
  value = "${module.tiller_version.value}"
}
output "helm_image" {
  value = "${module.helm_image.value}"
}
output "helm_version" {
  value = "${module.helm_version.value}"
}
