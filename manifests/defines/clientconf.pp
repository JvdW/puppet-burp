# Define: burp::defines::clientconf
#
define burp::defines::clientconf (
  $setting = $title,
  ) {
  
  $value = $clientconfdir_hash[$settings]
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/clientconfdir/${title}",
    section => '',
  }
  
  ini_setting { "/etc/burp/clientconfdir/${title}":
    setting => $setting,
    value   => $value,
  }

}
