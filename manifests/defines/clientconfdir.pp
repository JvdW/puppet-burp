# Define: burp::defines::clientconfdir
#
define burp::defines::clientconfdir (
  $clientconfdir_hash,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode => "600",
  }
  
  # Fill /etc/burp/clientconfdir directory, each client needs a config file
  create_resources( 'burp::defines::clientconf', $burp::clientconfdir_hash[settings] )

}
