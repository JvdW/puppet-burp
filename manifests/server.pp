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
  create_resources( 'burp::defines::clientconfdir', $burp::clientconfdir_hash )
  
  # Set settings in /etc/burp/burp-server.conf
  create_resources( 'burp::defines::burp_server', $burp::burp_server_hash )

}
