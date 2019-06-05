# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include elasticsearch
class elasticsearch (
  Enum['0.90', '1'] $version,
  String $heap_size,
  String $max_locked_memory,
  String $bootstrap_mlockall,
  String $http_max_content_length,
  Integer $number_of_shards,
  Integer $number_of_replicas,
) {

  class { 'elasticsearch::repo': }
  -> class { 'elasticsearch::install': }
  -> class { 'elasticsearch::config': }
  ~> class { 'elasticsearch::service': }

  contain elasticsearch::repo
  contain elasticsearch::install
  contain elasticsearch::config
  contain elasticsearch::service

}
