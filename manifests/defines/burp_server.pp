# Define: burp::defines::burp_server
#
define burp::defines::burp_server (
  $value,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp-server.conf",
    section => '',
  }
  
  ini_setting { $title:
    setting => $title,
    value   => $value,
  }

}
