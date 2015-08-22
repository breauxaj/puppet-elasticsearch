define elasticsearch::service (
  $ensure,
  $enable
) {
  include ::elasticsearch

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'elasticsearch',
  }

  service { $service:
    ensure  => $ensure,
    enable  => $enable,
  }

}
