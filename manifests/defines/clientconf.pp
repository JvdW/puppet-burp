# Define: burp::defines::clientconf
#
define burp::defines::clientconf (
  $setting,
  $value,
  ) {
  
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
