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

variable "test" {
  default = 0
}


module "provision" {
  source = "./modules/flag"
  option= "${var.provision_bootkube}"
}

resource "null_resource" "master_provision" {
  count = "${signum(var.bootkube + module.recover_cluster.if_active + module.provision.if_active)}"
  triggers {
    recover = "${module.recovery_version.value}"
    sha = "${module.seed.bootkube_sha}"
    version = "${module.versions.bootkube_version}"
    master = "${element(module.master.ids,0)}"
  }

  connection {
    host = "${element(module.master.ips, 0)}"
    type     = "ssh"
    user     = "core"
    private_key = "${module.iaas.private_key}"

    bastion_host = "${module.bastion_host.value}"
    bastion_user = "${module.bastion_user.value}"
    bastion_private_key = "${module.iaas.private_key}"
  }

  provisioner "file" {
    content = "${file(module.seed.bootkube_path)}"
    destination = "bootkube.zip"
  }
  provisioner "file" {
    content = "${file(data.archive_file.helper_scripts.output_path)}"
    destination = "helper.zip"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p ${module.cluster.bootkube_inst_dir}/bin",
      "sudo unzip -o helper.zip -d ${module.cluster.bootkube_inst_dir}/bin/",
      "sudo chmod +x ${module.cluster.bootkube_inst_dir}/bin/*"
    ]
  }
}

resource "null_resource" "master_setup" {
  depends_on = [ "null_resource.master_provision" ]
  count = "${signum(var.bootkube + module.recover_cluster.if_active)}"

  triggers {
    provision = "${null_resource.master_provision.id}"
  }

  connection {
    host = "${element(module.master.ips, 0)}"
    type     = "ssh"
    user     = "core"
    private_key = "${module.iaas.private_key}"

    bastion_host = "${module.bastion_host.value}"
    bastion_user = "${module.bastion_user.value}"
    bastion_private_key = "${module.iaas.private_key}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p ${module.cluster.bootkube_inst_dir}/bin",
      "rm -rf bootkube && unzip bootkube.zip -d bootkube",
      "sudo rm -rf ${module.cluster.assets_inst_dir}",
      "sudo mv bootkube ${module.cluster.assets_inst_dir}",
    ]
  }
}

resource "local_file" "reset_bootkube" {
  depends_on = [ "null_resource.master_setup" ]
  content     = "bootkube=0"
  filename = "${path.cwd}/bootkube.auto.tfvars"
}

resource "local_file" "access_info" {
  content     = <<EOF
master = "${element(module.master.ids,0)}"
master_ip = "${element(module.master.ips,0)}"
bastion_ip = "${module.bastion_host.value}"
bastion_user = "${module.bastion_user.value}"
EOF
  filename = "${module.cluster.gen_dir}/access_info"
}

resource "null_resource" "test" {
  count = "${var.test}"
  triggers {
    master = "${element(module.master.ids,0)}"
    master_ip = "${element(module.master.ips,0)}"
    bastion_ip = "${module.bastion_host.value}"
    bastion_user = "${module.bastion_user.value}"
    test   = 2
  }

  connection {
    host = "${element(module.master.ips, 0)}"
    type     = "ssh"
    user     = "core"
    private_key = "${module.iaas.private_key}"

    bastion_host = "${module.bastion_host.value}"
    bastion_user = "${module.bastion_user.value}"
    bastion_private_key = "${module.iaas.private_key}"
  }

  provisioner "file" {
    content = "demo"
    destination = "demo"
  }
}

output "etcd_backup_file" {
  value = "${var.etcd_backup_file}"
}
