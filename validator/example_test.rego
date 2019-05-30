#
# Copyright 2019 Google LLC
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

package templates.gcp.GCPExampleConstraintV1

# Find all violations from test constraint and data.
violations[violation] {
	asset := data.test.fixtures.assets.example[_]
	constraint := data.test.fixtures.constraints.example
	issues := deny with input.asset as asset
		 with input.constraint as constraint

	violation := issues[_]
}

test_example_violation {
	count(violations) == 1
	violations[_].details.resource == "//cloudsql.googleapis.com/projects/project-id/instances/bad"	
}