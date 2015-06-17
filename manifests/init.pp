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

# client: settings for /etc/burp/burp.conf
  $client                  = true,
  $client_ssl_key_password = "ssl_key_password",
  $client_extra_options    = [ 'ratelimit=10', 'vss_drives=0' ],
  $password                = "password",
  $server_ip               = "172.16.3.13",
  $cname                   = $fqdn,
  $server_can_restore      = "1",
  $includes                = [ '/home', '/var/log' ],
  $excludes                = [ '/home/ubuntu' ],
 
# server: settings for /etc/burp-server.conf
  $server                      = false,
  $server_ssl_key_password     = "ssl_key_password",
  $directory                   = "/mnt/backup/burpdata",
  $working_dir_recovery_method = "resume",
  $max_children                = "25",
  $max_status_children         = "25",
  $keep                        = "100",
  $waittime                    = "20h",
  $starttime                   = "Mon,Tue,Wed,Thu,Fri,Sat,Sun,00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23",
  $backup_stats_logstash       = true,
  $common_clientconfig         = [ 'randomise=1200' ],
  $server_extra_options        = [ 'ratelimit=10' ],
  
# server: create client config files in /etc/clientconfdir
  $clientconf_hash = { 'localhost'          => { password => 'password', },
                       'linuxclient.domain' => { password => 'password', },
                       'workstation.domain' => { password => 'password', },
                     },
  $burp_server_hash = { 'client' => { value => 'true',
                                    },
                      },
  
  # client: settings for /etc/burp/burp.conf
  $burp_hash = { 'server'                  => { value => '10.1.1.1',
                                              },
                 'client_ssl_key_password' => { value => 'ssl_key_password',
                                              },
                 'password'                => { value => 'password',
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
  
  #class { 'burp::settings': }
  
}
