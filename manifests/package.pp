# Class: burp::package
#
class burp::package {

  $burp_requires = [ "librsync-dev", "libz-dev", "libssl-dev", "uthash-dev", "libyajl-dev" ]

  if $::operatingsystem != 'Ubuntu' {
    notice('Operatingsystem not supported, perform manual burp installation.')
  }
  
  else {
  
    package { $burp_requires:
      ensure => installed
    }

    wget::fetch { 'burp_package':
      source      => "http://burp.grke.org/downloads/burp-${burp::version}/burp-${burp::version}.tar.bz2",
      destination => "/tmp/burp-${burp::version}.tar.bz2",
      timeout     => 0,
      verbose     => false,
    }

    exec { 'unpack_burp':
      command => "/bin/tar -xzvf /tmp/burp-${burp::version}.tar.bz2 -C /tmp/",
      unless  => "/usr/bin/test -d /tmp/burp-${burp::version}",
      require => Wget::Fetch['burp_package']
    }
    
    exec { 'configure_burp':
      command => '/tmp/burp-${burp::version}/configure.sh && /usr/bin/make && /usr/bin/make install',
      cwd     => '/tmp/burp-${burp::version}',
      unless  => '/usr/bin/test -d /etc/burp',
      require => Exec['unpack_burp']
    }
    
  }

}
