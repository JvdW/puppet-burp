# Define: burp::defines::clientconfdir
#
define burp::defines::clientconfdir (
  $clientconfdir_hash,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode => "600",
  }
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/clientconfdir/${title}",
    section => '',
  }
  
  ini_setting { "/etc/burp/clientconfdir/${title}":
    setting => $clientconfdir_hash[$settings][$title],
    value   => $clientconfdir_hash[$settings][$value],
  }

}
