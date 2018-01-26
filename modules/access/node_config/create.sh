#!/bin/bash -e
COPYRIGHT='#
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
'

header="$COPYRIGHT

##############################################################################
# node config handling
# generated by create.sh based on local variables.tf
##############################################################################"

variable="node_config"
locals=X

cd "$(dirname "$0")"
source ../create.sh
