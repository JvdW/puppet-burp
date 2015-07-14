# Class: burp::client
#
class burp::client {

  # Set settings in /etc/burp/burp.conf
  create_resources( 'burp::defines::burp', $burp::burp_hash )
  
  # Set cname as fqdn
  ini_setting { "/etc/burp/burp.conf":
    ensure  => present,
    path    => "/etc/burp/burp.conf",
    setting => cname,
    value   => $fqdn,
  }

}
