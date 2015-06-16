# Class: burp::server
#
class burp::server {

  # Common settings for all clients
  file { '/etc/burp/clientconfdir/incexc/common':
    ensure  => present,
    mode    => '600',
    content => template("burp/common.erb"),
  }

  # Modify backup_stats file so that logstash can use it as input
  #if $burp::backup_stats_logstash == true {
  #  file { '/etc/burp/notify_script':
  #    content => template("burp/notify_script.erb"),
  #    mode    => 0700,
  #    require => Package['burp']
  #  }
  #}
  
  # Each client needs a config file on the server
  create_resources('burp::defines::clientconf', $burp::defines::clientconf_hash)

}
