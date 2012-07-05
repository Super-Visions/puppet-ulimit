#
# == Class: ulimit::config
#
# The ulimit::config class takes care of creating the ulimit.conf file
# and putting it in the correct place on the filesystem
#
# === Parameters
#
#   The defaults are fetched via hiera from ulimit::data.
#   They can also be set in any other hiera data file.
#
# [*ulimit_user*]
#   The user that must be owner of the file.
#
# [*ulimit_group*]
#   The group that must be owner of the file.
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
#  class { 'ulimit::config': }
#
# example definition in hiera
#
# ulimit_rules:
#   ulimit_memlock:
#     ulimit_domain: *   
#     ulimit_type: '-'  
#     ulimit_item: memlock
#     ulimit_value: 72000000
#   ulimit_test:
#     ulimit_domain: ':123'
#     ulimit_type: hard
#     ulimit_item: cpu
#     ulimit_value: 5000  
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ulimit::config(
  $ulimit_config_dir = hiera('ulimit_config_dir'),
  $ulimit_rules      = hiera('ulimit_rules', {})
)
{
  file { $ulimit_config_dir:
      ensure  => directory,
  }

  if( $ulimit_rules )
  {
    create_resources( ulimit::rule, $ulimit_rules )
  }
}
