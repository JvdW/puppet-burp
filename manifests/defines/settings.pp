# Define: burp::defines::settings
#
define burp::defines::settings (
  $foosetting,
  $value,
  ) {
  
  # Common settings
  Ini_setting {
	  ensure  => present,
	  path    => "/tmp/foo.ini",
	  section => '',
	}
  
  ini_setting { 'sample setting':
    setting => $foosetting,
    value   => $foovalue,
  }

}
