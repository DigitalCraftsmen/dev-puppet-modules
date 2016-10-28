# == Class: php
#
# === Examples
#
#  class { 'php':
#    php     => 'NO',
#    php_fpm => 'YES',
#  }
#
# === Authors
#
# Aneesh C <aneeshchandrasekharan@gmail.com>
#

class php (
  $php              = 'YES',
  $php_fpm          = 'NO',
  $package_name     = $::php::params::package_name,
  $package_name_fpm = $::php::params::package_name_fpm,
  $template         = $::php::params::template,
  $configfile       = $::php::params::configfile,
  $configfile_fpm   = $::php::params::configfile_fpm,
  $expose_php       = 'Off',
  $open_basedir     = '/var/www/',
  $error_log        = '/var/log/php_error.log',
) inherits ::php::params {
  if $php == 'YES' {
    package { $package_name: ensure => installed }
    file { $configfile:
      require => package[$package_name],
      content => template($template),
    }
  }
  if $php_fpm == 'YES' {
    package { $package_name_fpm: ensure => installed }
    file { $configfile_fpm:
      require => package[$package_name_fpm],
      content => template($template),
    }
    if $::osfamily == 'RedHat' {
      service { 'php-fpm':
        require => package[$package_name_fpm],
        enable  => true,
      }
    }
  }
}
