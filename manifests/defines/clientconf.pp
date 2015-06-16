# Define: burp::defines::clientconf
#
define burp::defines::clientconf (
  $password,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode    => "600",
    content => template('burp/clientconf.erb'),
    require => File['/etc/burp/clientconfdir'],
  }

}
