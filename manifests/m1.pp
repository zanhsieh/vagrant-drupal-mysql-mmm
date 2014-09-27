group { 'puppet':
  ensure => 'present'
}

$packagelist = [
  'wget',
  'vim-enhanced'
]

package { $packagelist:
  ensure => 'installed'
}

class { '::mysql::server':
  override_options => {
    'mysqld' => {
      'bind_address'    => '192.168.30.101',
      'server_id'       => '1',
      'log_bin'         => 'mysql_bin.log'
    }
  },
  users => {
    'repl@%' => {
       ensure           => 'present',
       password_hash    => mysql_password('repl')
    },
    'root@192.168.30.%' => {
       ensure => 'present'
    },
    'druser@192.168.30.%' => {
       ensure           => 'present',
       password_hash    => mysql_password('druser')
    }
  },
  grants => {
    'repl@%/*.*' => {
        ensure      => 'present',
        options     => ['GRANT'],
        privileges  => ['REPLICATION SLAVE'],
        table       => '*.*',
        user        => 'repl@%'
    },
    'root@192.168.30.%' => {
       ensure => 'present',
       options => ['GRANT'],
       privileges => ['ALL'],
       table => '*.*',
       user => 'root@192.168.30.%'
    }
  }
}

service { 'iptables':
  ensure => 'stopped'
}