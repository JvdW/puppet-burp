# Class: burp::client
#
class burp::client {

  # Set settings in /etc/burp/burp.conf
  create_resources( 'burp::defines::burp', $burp::burp_hash )

}
