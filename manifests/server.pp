# Class: burp::server
#
class burp::server {

  # Common settings for all clients
  file { '/etc/burp/clientconfdir/incexc/common':
    ensure  => present,
    mode    => '600',
    content => template("burp/common.erb"),
  }

  # Fill /etc/burp/clientconfdir directory, each client needs a config file
  create_resources( 'burp::defines::clientconf', $burp::clientconf_hash )
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp-server.conf",
    section => '',
  }
  
  # Set settings in /etc/burp/burp-server.conf
  create_resources( 'ini_setting', $burp::burp_server_hash )

}
