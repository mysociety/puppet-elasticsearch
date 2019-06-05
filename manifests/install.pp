#
# @summary Installs elasticsearch
#
# Installs the elasticsearch package
#
# @example
#   include elasticsearch::install
#
class elasticsearch::install {

  package { 'elasticsearch':
    ensure => 'installed',
  }

}
