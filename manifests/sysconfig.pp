define elasticsearch::sysconfig (

) {
  include ::elasticsearch

  $conf = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/sysconfig',
  }

  file { "${conf}/elasticsearch":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('elasticsearch/sysconfig.erb'),
  }

}
