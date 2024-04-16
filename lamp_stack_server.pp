package { 'apache2':
  ensure => installed,
}
package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}
service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}
file { '/var/www/html/phpinfo.php':
  source => '/home/lab9/abdalaahmed_inet4031_puppet_lab9',
  notify  => Service['apache2'],
  require => [Package['apache2']]
}
package { 'mysql-server':
  ensure => installed,
}
service { 'mysql':
  ensure => running,
}
package { 'php5':    
  ensure => installed,
}
