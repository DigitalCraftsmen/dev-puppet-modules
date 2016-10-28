# php Module

## Overview

This module install and configure php server.

## Usage

Default configuration:

```puppet
include php
```

Custom configuration:

```puppet
class { 'php':
    php          => 'YES',
    php_fpm      => 'YES',
    xpose_php    => 'Off',
    open_basedir => '/var/www/',
}
```

php-fpm configuration:

```puppet
class { 'php::php_fpm':
    user  => 'www-data',
    group => 'www-data',
}
```
