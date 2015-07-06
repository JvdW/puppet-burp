# Define: burp::defines::burp
#
define burp::defines::burp (
  $value,
  $section = undef,
  ) {
  
  # Common settings
  Ini_setting {
    ensure         => present,
    path           => "/etc/burp/burp.conf",
    section_prefix => '#',
    section_suffix => '',
  }
  
  ini_setting { "/etc/burp/burp.conf_${title}":
    setting => $title,
    value   => $value,
    section => $section
  }

}
