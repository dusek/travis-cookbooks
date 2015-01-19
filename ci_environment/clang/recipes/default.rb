#
# Cookbook Name:: clang
# Recipe:: default
# Copyright 2012-2013, Travis CI Development Team <contact@travis-ci.org>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

apt_repository "llvm" do
  uri          "http://llvm.org/apt/#{node['lsb']['codename']}"
  distribution "llvm-toolchain-#{node['lsb']['codename']}-#{node['clang']['version']}"
  components   ["main"]
  key          "http://llvm.org/apt/llvm-snapshot.gpg.key"
  action       :add
end

packages = %w(
  clang-%s
  clang-%s-doc
  libclang-common-%s-dev
  libclang-%s-dev
  libclang1-%s
  libclang1-%s-dbg
  libllvm-%s-ocaml-dev
  libllvm%s
  libllvm%s-dbg
  lldb-%s
  llvm-%s
  llvm-%s-dev
  llvm-%s-doc
  llvm-%s-examples
  llvm-%s-runtime
  clang-modernize-%s
  clang-format-%s
  python-clang-%s
  lldb-%s-dev
).map { |x| x % node['clang']['version'] }

execute "install clang-#{node['clang']['version']} packages" do
  command "apt-get install #{packages.join(' ')}"
  user 'root'
end
