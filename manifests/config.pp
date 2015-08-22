define elasticsearch::config (
  $value
) {
  include ::elasticsearch

  $key = $title

  $context = '/files/etc/???.conf'

  augeas { "???_conf/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
  }

}