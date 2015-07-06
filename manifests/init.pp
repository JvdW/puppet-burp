# == Class: burp
#
# Full description of class burp here.
#
# === Parameters
#
# Document parameters here.
#
# [*client*]
#   Do you want your instance to have the burp client software installed.
#
# [*client_ssl_key_password*]
#   This password is used before the first backup, to generate ssl keys.
#
# [*client_extra_options*]
#   Options that are commented in the configfile, uncomment them by adding them here. 
#   See http://burp.grke.org/docs/manpage.html for all options.
#
# [*password*]
#   Authentication password between client and server.
#
# [*server_ip*]
#   The client will connect to this IP address.
#
# [*cname*]
#   The name of the client. Corresponds with client filename in /etc/burp/clientconf on burp server.
#
# [*server_can_restore*]
#   Allow server to initiate restores.
#
# [*includes*]
#   Array of locations to include in backup.
#
# [*excludes*]
#   Exceptions on includes.
#
# [*server_extra_options*]
#   Options that are commented in the configfile, uncomment them by adding them here. 
#   See http://burp.grke.org/docs/manpage.html for all options.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { burp:
#    version => latest,
#    client  => true,
#    server  => true
#  }
#
# === Authors
#
# Author Name rudi.broekhuizen@naturalis.nl
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class burp (

  # general
  $version = "1.4.36",
  $server  = true,
  $client  = true,
  
  # server: create client config files in /etc/burp/clientconfdir
  $clientconf_hash = { 'localhost'          => { clientconf => [ 'password = password',
                                                                 '#key     = value',
                                                               ],
                                               },
                       'linuxclient.domain' => { clientconf => [ 'password = password' 
                                                               ],
                                               },
                       'workstation.domain' => { clientconf => [ 'password = password' 
                                                               ],
                                               },
                     },
  
  # server: settings that apply to all clients /etc/burp/clientconfdir/incexc/common
  $common = [ 'randomise = 1200' ],

  # server: settings for /etc/burp-server.conf
  $burp_server_hash = { 'ssl_key_password' => { value => 'password',
                                              },
                        'directory'        => { value => '/tmp',
                                              },
                      },
  
  # client: settings for /etc/burp/burp.conf
  $burp_hash = { 'server'             => { value => 'localhost',
                                         },
                 'ssl_key_password'   => { value => 'password',
                                         },
                 'password'           => { value => 'password',
                                         },
                 'cname'              => { value => 'cname',
                                         },
                 'server_can_restore' => { value => '1',
                                         },
                 'include'            => { value   => '/home',
                                           section => '/home',
                                         },
                 'include'            => { value   => '/etc/vpnc',
                                           section => '/etc/vpnc',
                                         },
                 'include'            => { value   => '/var/log',
                                           section => '/var/log',
                                         },
                 'exclude'            => { value   => '/home/ubuntu',
                                           section => '/home/ubuntu',
                                         },
               },
) {

  # Install package 
  include burp::package

  if $server == true {
    class { 'burp::server': 
    }
    class { 'burp::service':
      require => Class['burp::server']
    }
  }

  if $client == true {
    class { 'burp::client': }
  }
  
}
