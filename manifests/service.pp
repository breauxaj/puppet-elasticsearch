define elasticsearch::service (
  $ensure,
  $enable
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'elasticsearch',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}
