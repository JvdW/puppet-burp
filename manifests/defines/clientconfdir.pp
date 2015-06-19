# Define: burp::defines::clientconfdir
#
define burp::defines::clientconfdir (
  $settings,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode => "600",
  }
  
  # Common settings
  Ini_setting {
    ensure  => present,
    path    => "/etc/burp/clientconfdir/${title}",
    section => '',
  }
  
  # Client specific settings
  #ini_setting { "/etc/burp/clientconfdir/${title}":
  #  setting => $settings['setting'],
  #  value   => $settings['value']
  #}
  
  create_resources( 'ini_setting', $settings )
 
}
