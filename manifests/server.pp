# Class: burp::server
#
class burp::server {

  # Common settings for all clients
  file { '/etc/burp/clientconfdir/incexc/common':
    ensure  => present,
    mode    => '600',
    content => template("burp/common.erb"),
  }

  # Fill /etc/burp/clientconfdir directory, each client needs a config file on the server
  create_resources('burp::defines::clientconf', $burp::defines::clientconf_hash)

}
