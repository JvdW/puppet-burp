# Class: burp::service
#
class burp::service {

# Service file
  file { '/etc/default/burp':
    ensure  => present,
    mode    => '600',
    content => template("burp/default.erb"),
  }

  # Start service
  service { 'burp':
    ensure  => 'running',
    require => File['/etc/default/burp'] 
  }

}
