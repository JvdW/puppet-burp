# Define: burp::defines::burp
#
define burp::defines::burp (
  $value,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp.conf",
    section => '',
  }
  
  ini_setting { $title:
    setting => $title,
    value   => $value,
  }

}
