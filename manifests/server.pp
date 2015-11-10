# Class: burp::server
#
class burp::server {

  $burp_server_hash_defaults = { 'path'           => '/etc/burp/burp-server.conf',
                                 'section_prefix' => '#[',
	                    	       }

  # Common settings for all clients
  file { '/etc/burp/clientconfdir/incexc/common':
    ensure  => present,
    mode    => '600',
    content => template("burp/common.erb"),
  }

  # Fill /etc/burp/clientconfdir directory, each client needs a config file
  create_resources( 'burp::defines::clientconf', $burp::clientconf_hash )
  
  # Set settings in /etc/burp/burp-server.conf
  create_ini_settings($burp::burp_server_hash, $burp_server_hash_defaults)

  # Create backup directory
  if has_key($burp::burp_server_hash, 'directory') {
    $directory_hash = $burp::burp_server_hash[directory]
    if is_hash($directory_hash) {
      $directory = $directory_hash[value]
    }
    file { "$directory":
      ensure => directory,
      mode   => '600',
    }
  }
}
