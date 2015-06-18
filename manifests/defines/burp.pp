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
  
  ini_setting { "/etc/burp/burp.conf_$title":
    setting => $title,
    value   => $value,
  }

}
