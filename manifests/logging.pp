define elasticsearch::logging (

) {
  include ::elasticsearch

  $conf = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/elasticsearch',
  }

  file { "${conf}/logging.yml":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('elasticsearch/logging.erb'),
  }

}
