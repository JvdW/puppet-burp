# Define: burp::defines::settings
#
define burp::defines::settings (
  $foosetting,
  $foovalue,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp-server.conf",
    section => '',
  }
  
  ini_setting { 'burp-server.conf':
    setting => $foosetting,
    value   => $foovalue,
  }

}
