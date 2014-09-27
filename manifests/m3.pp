group { 'puppet':
  ensure => 'present'
}

$packagelist = [
  'wget',
  'vim-enhanced',
  'mysql',
  'apr',
  'apr-util',
  'apr-util-ldap',
  'freetype',
  'httpd',
  'httpd-tools',
  'libX11',
  'libX11-common',
  'libXau',
  'libXpm',
  'libjpeg-turbo',
  'libpng',
  'libxcb',
  'libxslt',
  'mailcap',
  'php',
  'php-cli',
  'php-common',
  'php-gd',
  'php-mbstring',
  'php-pdo',
  'php-xml',
  'php-mysql',
  'php-pecl-apc'
]

package { $packagelist:
  ensure => 'installed'
}

service { 'iptables':
  ensure => 'stopped'
}

