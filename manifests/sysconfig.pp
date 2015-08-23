define elasticsearch::sysconfig (
  $value
) {
  include ::elasticsearch

  $key = $title

  $context = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      '/files/etc/sysconfig/elasticsearch'
    ],
  }

  augeas { "sysconfig_elasticsearch/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}
