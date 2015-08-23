define elasticsearch::sysconfig (
  $data_dir = undef,
  $log_dir = undef,
  $work_dir = undef,
  $es_heap_size = undef,
  $es_heap_newsize = undef,
  $es_direct_size = undef,
  $es_java_opts = undef,
  $es_restart_on_upgrade = undef,
  $es_gc_log_file = undef,
  $es_user = undef,
  $es_group = undef,
  $max_open_files = undef,
  $max_locked_memory = undef,
  $max_map_count = undef
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
