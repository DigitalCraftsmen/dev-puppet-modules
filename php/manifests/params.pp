class php::params {
  if $::osfamily == 'Redhat' {
    $package_name = [ 'php', 'php-mcrypt', 'php-mysql' ]
    $package_name_fpm = [ 'php-fpm', 'php-mcrypt', 'php-mysql' ]
    $configfile = '/etc/php.ini'
    $configfile_fpm = '/etc/php.ini'
    $configfile_www = '/etc/php-fpm.d/www.conf'
    $template_www = 'php/www.conf.c.erb'
    case $::operatingsystemrelease {
      /^6.*/: {
        $template = 'php/php.ini.c.6.erb'
      }
      /^7.*/: {
        $template = 'php/php.ini.c.7.erb'
      }
      default: {
        $template = 'php/php.ini.c.6.erb'
      }
    }
  }
  if $::osfamily == 'Debian' {
    case $::operatingsystemrelease {
      /^12.*/: {
        $package_name = [ 'php5', 'php5-mcrypt', 'libapache2-mod-php5', 'php5-mysql' ]
        $package_name_fpm = [ 'php5-fpm', 'php5-mcrypt', 'php5-mysql' ]
        $configfile = '/etc/php5/apache2/php.ini'
        $configfile_fpm = '/etc/php5/fpm/php.ini'
        $configfile_www = '/etc/php5/fpm/pool.d/www.conf'
        $template = 'php/php.ini.u.12.erb'
        $template_www = 'php/www.conf.u.12.erb'
      }
      /^14.*/: {
        $package_name = [ 'php5', 'php5-mcrypt', 'libapache2-mod-php5', 'php5-mysql' ]
        $package_name_fpm = [ 'php5-fpm', 'php5-mcrypt', 'php5-mysql' ]
        $configfile = '/etc/php5/apache2/php.ini'
        $configfile_fpm = '/etc/php5/fpm/php.ini'
        $configfile_www = '/etc/php5/fpm/pool.d/www.conf'
        $template = 'php/php.ini.u.14.erb'
        $template_www = 'php/www.conf.u.14.erb'
      }
      /^16.*/: {
        $package_name = [ 'php', 'php-mcrypt', 'libapache2-mod-php', 'php5-mysql' ]
        $package_name_fpm = [ 'php-fpm', 'php-mcrypt', 'php5-mysql' ]
        $configfile = '/etc/php/7.0/apache2/php.ini'
        $configfile_fpm = '/etc/php/7.0/fpm/php.ini'
        $configfile_www = '/etc/php/7.0/fpm/pool.d/www.conf'
        $template = 'php/php.ini.u.16.erb'
        $template_www = 'php/www.conf.u.16.erb'
      }
      default: {
        $package_name = [ 'php5', 'php5-mcrypt', 'libapache2-mod-php5', 'php5-mysql' ]
        $package_name_fpm = [ 'php5-fpm', 'php5-mcrypt', 'php5-mysql' ]
        $configfile = '/etc/php5/apache2/php.ini'
        $configfile_fpm = '/etc/php5/fpm/php.ini'
        $configfile_www = '/etc/php5/fpm/pool.d/www.conf'
        $template = 'php/php.ini.u.12.erb'
        $template_www = 'php/www.conf.u.12.erb'
      }
    }
  }
}
