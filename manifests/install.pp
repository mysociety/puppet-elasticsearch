#
# @summary Installs elasticsearch
#
# Installs the elasticsearch package
#
# @example
#   include elasticsearch::install
#
class elasticsearch::install (
  String $package_ensure = $elasticsearch::package_ensure,
) {

  package { 'elasticsearch':
    ensure => $package_ensure,
  }

}
