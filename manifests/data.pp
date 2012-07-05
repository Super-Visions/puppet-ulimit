#
# == Class: ulimit::data
#
# The ulimit::data class holds the defaults for all
# variables and parameters used in the ulimit class.
#
# === Parameters
#
# This class does not take parameters.
#
# === Variables
#
# [*ulimit_config_dir*]
#   Default ulimit config dir.
#
# === Examples
#
#  class { 'ulimit::data': }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ulimit::data {
  case $::operatingsystem
  {
    ubuntu, debian: {
      $ulimit_config_dir = '/etc/security/limits.d'
    }
    centos, redhat: {
      $ulimit_config_dir = '/etc/security/limits.d'
    }
    default:
    {
      fail("Unknown OS: $::operatingsystem")
    }
  }
}
