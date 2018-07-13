# Private class
define haproxy::install (
  # lint:ignore:140chars
  $package_ensure,
  $package_name = undef,  # A default is required for Puppet 2.7 compatibility. When 2.7 is no longer supported, this parameter default should be removed.
  $package_install_options = [],
  # lint:endignore
) {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $package_name != undef {
    package { $package_name:
      ensure          => $package_ensure,
      alias           => 'haproxy',
      install_options => $package_install_options,
    }
  }

}
