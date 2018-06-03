define template_file::template_file (
    $template_location,
    $file_owner,
    $file_group,
    $file_mode,
    $data = []
  ) {

  file { $name:
    content => template($template_location),
    owner   => $file_owner,
    group   => $file_group,
    mode    => $file_mode,
  }
}
