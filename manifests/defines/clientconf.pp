# Define: burp::defines::clientconf
#
define burp::defines::clientconf (
  $clientconf,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode    => "600",
    content => template('burp/clientconf.erb'),
  }

}
