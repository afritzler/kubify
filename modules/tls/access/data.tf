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


variable "tls" {
  type = "map"
}

output "private_key_pem" {
  value = "${lookup(var.tls,"private_key_pem")}"
}

output "public_key_pem" {
  value = "${lookup(var.tls,"public_key_pem")}"
}

output "cert_pem" {
  value = "${lookup(var.tls,"cert_pem")}"
}

output "ca_cert" {
  value = "${lookup(var.tls,"ca_cert")}"
}

output "ca_key" {
  value = "${lookup(var.tls,"ca_key")}"
}


output "private_key_pem_b64" {
  value = "${base64encode(lookup(var.tls,"private_key_pem"))}"
}

output "public_key_pem_b64" {
  value = "${base64encode(lookup(var.tls,"public_key_pem"))}"
}

output "cert_pem_b64" {
  value = "${base64encode(lookup(var.tls,"cert_pem"))}"
}

output "ca_cert_b64" {
  value = "${base64encode(lookup(var.tls,"ca_cert"))}"
}

output "ca_key_b64" {
  value = "${base64encode(lookup(var.tls,"ca_key"))}"
}


output "tls" {
  value = "${var.tls}"
}

