# Class: burp::client
#
class burp::client {

  # Configure burp.conf client config file
  file { '/etc/burp/burp.conf':
    ensure  => present,
    mode    => '600',
    content => template("burp/burp.conf.erb"),
    require => Class['burp::package']
  }

}
