# Define: burp::defines::clientconfdir
#
define burp::defines::clientconfdir (
  $password,
  ) {

  file { "/etc/burp/clientconfdir/${title}":
    mode => "600",
  }

}
