include_attribute 'travis_build_environment'

default['android-ndk']['name']           = 'android-ndk'
default['android-ndk']['owner']          = node['travis_build_environment']['user']
default['android-ndk']['group']          = node['travis_build_environment']['group']
default['android-ndk']['setup_root']     = nil  # ark defaults (/usr/local) is used if this attribute is not defined

default['android-ndk']['version']        = 'r10c'
default['android-ndk']['download_url']   = "http://dl.google.com/android/ndk/android-ndk32-#{node['android-ndk']['version']}-linux-x86_64.tar.bz2"
