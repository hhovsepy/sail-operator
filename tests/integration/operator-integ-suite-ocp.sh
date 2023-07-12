#!/bin/bash

# Copyright 2023 Red Hat, Inc.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

WD=$(dirname "$0")
WD=$(cd "$WD"; pwd)

# Exit immediately for non zero status
set -e
# Check unset variables
set -u
# Print commands
set -x

echo "--------------------------------"
echo "Build an operator image"
echo "--------------------------------"
"${WD}"/build-operator.sh

# deploy operator in OCP
echo "--------------------------------"
echo "Deploy istio operator in OCP"
echo "--------------------------------"
"${WD}"/deploy-operator.sh

# create a Istio Helm Install CP and test httpbin
echo "--------------------------------"
echo "Create a IstioHelmInstall Control Plane and test httpbin"
echo "--------------------------------"
"${WD}"/control-plane-test.sh