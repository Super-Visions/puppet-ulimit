#
# == Class: ulimit::rule
#
# The ulimit::config class takes care of creating the ulimit.conf file
# and putting it in the correct place on the filesystem
#
# === Parameters
#
#   The defaults are fetched via hiera from ulimit::data.
#   They can also be set in any other hiera data file.
#
# [*ulimit_domain*]
#   domain
#
# [*ulimit_type*]
#   Type
#
# [*ulimit_item*]
#   Item.
#
# [*ulimit_value*]
#   Value.
#
# [*ensure*]
#   present or absent.
#
# [*ulimit_config_dir*]
#   The directory that must contain the file.
#
# === Variables
#
# No variables are used in the ulimit base class
#
# === Examples
#
#  class { 'ulimit::rule': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
define ulimit::rule ( $ulimit_domain, $ulimit_type, $ulimit_item, $ulimit_value, $ensure = 'present', $ulimit_config_dir = '/etc/security/limits.d' ) {
  case $ensure {
    'present': {
      file {
        "${ulimit_config_dir}/${name}.conf":
          ensure  => file,
          content => template ("${module_name}/rule.conf.erb");
      }
    }

    'absent': {
      file {
        "${ulimit_config_dir}/${name}.conf":
          ensure => absent;
      }
    }

    default: {
      fail( 'No ensure value found for ulimit rule.' )
    }
  }
}
