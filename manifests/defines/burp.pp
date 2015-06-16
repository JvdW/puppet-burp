# Define: burp::defines::burp
#
define burp::defines::burp (
  $key,
  $value,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp.conf",
    section => '',
  }
  
  ini_setting { '/etc/burp/burp.conf':
    setting => $key,
    value   => $value,
  }

}
