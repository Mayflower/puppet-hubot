class hubot::config (
  $hubot_opts  = '',
  $env_vars    = {},
  $adapter,
  $user,
  $group,
  $install_dir,
  $logfile    = '/var/log/hubot.log',
) {
  file { '/etc/default/hubot':
    ensure  => 'present',
    content => template('hubot/default.erb'),
    mode    => '0600',
  }

  file { '/etc/init.d/hubot':
    ensure  => 'present',
    content => template('hubot/hubot.init.erb'),
    mode    => '0755',
  }

  file { $logfile:
    ensure   => 'present',
    owner    => $user,
    mode     => '0755',
    checksum => 'none',
    backup   => false
  }
}
