#
# == Class: ulimit
#
# The ulimit class manges the ulimit.conf file based on data stored in hiera
#
# === Parameters
#
# This class does not take parameters as all parameters are fetched via hiera
# The parameter defaults are stored in the ulimit::data class
#
# === Variables
#
# No variables are used in the ulimit base class
#
# === Examples
#
#  class { ulimit: }
#
# === Authors
#
# Stefan Goethals <stefan.goethals@super-visions.com>
#
# === Copyright
#
# Copyright 2012 Super-Visions, unless otherwise noted.
#
class ulimit
{
  anchor { 'ulimit::start': }->
  class { 'ulimit::config': }->
  anchor { 'ulimit::end': }
}
