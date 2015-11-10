# Class: burp::client
#
class burp::client {

  $burp_hash_defaults = { 'path'           => '/etc/burp/burp.conf',
                          'section_prefix' => '#[',
	                      }

  # Set settings in /etc/burp/burp.conf
  create_ini_settings($burp::burp_hash, $burp_hash_defaults)
  
  # Set cname as fqdn
  ini_setting { "/etc/burp/burp.conf":
    ensure  => present,
    path    => "/etc/burp/burp.conf",
    setting => cname,
    value   => $fqdn,
  }

}
