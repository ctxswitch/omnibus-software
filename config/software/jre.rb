#
# Copyright 2012-2014 Chef Software, Inc.
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
#

name "jre"
default_version "7u3-b04"

dependency "rsync"

whitelist_file "jre/bin/javaws"
whitelist_file "jre/bin/policytool"
whitelist_file "jre/lib"
whitelist_file "jre/plugin"

if Ohai['kernel']['machine'] =~ /x86_64/
  source url: "http://download.oracle.com/otn-pub/java/jdk/7u3-b04/jre-7u3-linux-x64.tar.gz",
         md5: "3d3e206cea84129f1daa8e62bf656a28",
         cookie: 'oraclelicense=accept-securebackup-cookie;gpw_e24=http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html',
         warning: "By including the JRE, you accept the terms of the Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX, which can be found at http://www.oracle.com/technetwork/java/javase/terms/license/index.html"
else
  source url: "http://download.oracle.com/otn-pub/java/jdk/7u3-b04/jre-7u3-linux-i586.tar.gz",
         md5: "cfce10a05f8d152d39aef892f2cd4011",
         cookie: 'oraclelicense=accept-securebackup-cookie;gpw_e24=http://www.oracle.com/technetwork/java/javase/downloads/jre7-downloads-1880261.html',
         warning: "By including the JRE, you accept the terms of the Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX, which can be found at http://www.oracle.com/technetwork/java/javase/terms/license/index.html"
end

relative_path "jre1.7.0_03"

build do
  sync ".", "#{install_dir}/embedded/jre"
end
