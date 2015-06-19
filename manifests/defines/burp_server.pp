# Define: burp::defines::burp_server
#
define burp::defines::burp_server (
  $value,
  $section = undef,
  ) {
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/burp-server.conf",
  }
  
  ini_setting { "/etc/burp/burp-server.conf_${title}":
    setting => $title,
    value   => $value,
    section => $section
  }

}
