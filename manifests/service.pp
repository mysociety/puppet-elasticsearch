#
# @summary Manages the Elasticsearch service
#
# This class manages the Elasticsearch service
#
# @example
#   include elasticsearch::service
#
class elasticsearch::service {

  service { 'elasticsearch':
    ensure => 'running',
    enable => true,
  }

}
