# Define: burp::defines::clientconfdir
#
define burp::defines::clientconfdir (
  $clientconfdir_hash,
  $settings,
  $value,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode => "600",
  }
  
  # Common settings
  #Ini_setting {
  #  ensure  => present,
  #  path    => "/etc/burp/clientconfdir/${title}",
  #  section => '',
  #}
  
  #ini_setting { "/etc/burp/clientconfdir/${title}":
  #  setting => $burp::clientconfdir_hash[$settings][$title],
  #  value   => $burp::clientconfdir_hash[$settings][$value],
  #}
  
  notice ($burp::clientconfdir_hash[$settings][$title])

}
