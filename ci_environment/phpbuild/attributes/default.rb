default['phpbuild']['git']['repository'] = 'git://github.com/php-build/php-build.git'
default['phpbuild']['git']['revision'] = 'adac6156644f500476514e44656e31e6950913bb'
default['phpbuild']['phpunit_plugin']['git']['repository'] = 'git://github.com/CHH/php-build-plugin-phpunit.git'
default['phpbuild']['phpunit_plugin']['git']['revision'] = '2ee717c0e783809458f3073258c63f42500d1298'
default['phpbuild']['custom']['php_ini']['memory_limit'] = '1G'
default['phpbuild']['custom']['php_ini']['timezone'] = 'UTC'
default['phpbuild']['arch'] = (kernel['machine'] =~ /x86_64/ ? 'x86_64' : 'i386')
default['phpbuild']['prerequisite_recipes'] = %w(
  mysql::client
  postgresql::client
)
default['phpbuild']['packages'] = %w(
  lemon
  libbz2-dev
  libc-client2007e-dev
  libcurl4-gnutls-dev
  libexpat1-dev
  libfreetype6-dev
  libgmp3-dev
  libicu-dev
  libjpeg8-dev
  libkrb5-dev
  libldap2-dev
  libltdl-dev
  libmcrypt-dev
  libmhash-dev
  libpng12-dev
  libsasl2-dev
  libt1-dev
  libtidy-dev
  re2c
)
