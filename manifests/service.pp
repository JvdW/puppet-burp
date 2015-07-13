# Class: burp::service
#
class burp::service {

# Service file
  #file { '/etc/default/burp':
  #  ensure  => present,
  #  mode    => '600',
  #  content => template("burp/default.erb"),
  #}

# cp /tmp/burp-1.4.36/debian/burp.default /etc/default/burp
# cp /tmp/burp-1.4.36/debian/init /etc/init.d/burp
# chmod +x /etc/init.d/burp
# vi /etc/default/burp run=yes


  # Start service
  service { 'burp':
    ensure  => 'running',
    #require => File['/etc/default/burp'] 
  }


}
