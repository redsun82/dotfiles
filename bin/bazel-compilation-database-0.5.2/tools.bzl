# Copyright 2021 GRAIL, Inc.
#
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

def _bazel_output_base_util_impl(rctx):
    res = rctx.execute(["pwd"])
    if res.return_code != 0:
        fail("getting output base failed (%d): %s" % (res.return_code, res.stderr))

    # Strip last two path components.
    path_components = res.stdout.rstrip("\n").split("/")[:-2]
    output_base = "/".join(path_components)

    rctx.file("BUILD.bazel", "")
    rctx.file("defs.bzl", "OUTPUT_BASE = '%s'" % output_base)

bazel_output_base_util = repository_rule(
    implementation = _bazel_output_base_util_impl,
    local = True,
)

def setup_tools():
    bazel_output_base_util(
        name = "com_grail_bazel_output_base_util",
    )
