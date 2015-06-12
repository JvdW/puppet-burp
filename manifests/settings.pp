# == Class: burp::settings
#
class burp::settings {

  create_resources( 'burp::defines::settings', $burp::settings_hash )
  
}
