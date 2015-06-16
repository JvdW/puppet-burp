# Define: burp::defines::burp-server
#
define burp::defines::burp-server (
  $key,
  $value,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp-server.conf",
    section => '',
  }
  
  ini_setting { 'burp-server.conf':
    setting => $key,
    value   => $value,
  }

}
