class php::php_fpm (
  $package_name_fpm = $::php::params::package_name_fpm,
  $configfile_www   = $::php::params::configfile_www,
  $template_www     = $::php::params::template_www,
  $user             = undef,
  $group            = undef,
) inherits ::php::params {
  file { $configfile_www:
    require => package[$package_name_fpm],
    content => template($template_www),
  }
}
