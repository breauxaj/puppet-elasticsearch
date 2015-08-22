class elasticsearch (
  $version = '1.7',
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'elasticsearch',
  }

  $distro = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'centos',
  }

  $paths = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/tmp/elasticsearch',
      '/usr/share/elasticsearch/plugins',
      '/var/lib/elasticsearch',
      '/var/log/elasticsearch',
      '/var/run/elasticsearch'
    ],
  }

  yumrepo { 'elasticsearch':
    baseurl        => "http://packages.elastic.co/elasticsearch/${version}/${distro}'
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => 'http://packages.elastic.co/GPG-KEY-elasticsearch',
    descr          => "Elasticsearch repository for ${version}.x packages",
  }

  package { $required:
    ensure  => installed,
    require => Yumrepo['elasticsearch'],
  }

  file { $paths:
    ensure => directory,
    owner  => 'elasticsearch',
    group  => 'elasticsearch',
    mode   => '0755',
  }

  group { 'elasticsearch':
    ensure => present,
    gid    => 9200,
  }

  user { 'elasticsearch':
    ensure     => present,
    gid        => 9200,
    home       => '/home/elasticsearch',
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => 9200,
  }

}
