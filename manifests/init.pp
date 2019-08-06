#
# @summary Entry point for the mySociety Elasticsearch module
#
# This module installs and manages Elasticsearch in a very simple manner.
#
# @param manage_repo
#    Whether to manage the APT repository or not
#
# @param version
#    Version to install
#
# @param cluster_name
#    Name for the cluster
#
# @param node_name
#    Node name
#
# @param heap_size
#    Value for `ES_HEAP_SIZE`
#
# @param max_locked_memory
#    Value for `ES_MAX_LOCKED_MEMORY`
#
# @param bootstrap_mlockall
#    Control swap behaviour of the JVM
#
# @param http_max_content_length
#    Set max content length for HTTP traffic
#
# @param number_of_shards
#    How many shards
#
# @param number_of_replicas
#    How many replicas
#
# @example
#   class { 'elasticsearch': }
#
class elasticsearch (
  Boolean $manage_repo,
  Enum['0.90', '1'] $version,
  String $cluster_name,
  String $node_name,
  String $heap_size,
  String $max_locked_memory,
  String $bootstrap_mlockall,
  String $http_max_content_length,
  Integer $number_of_shards,
  Integer $number_of_replicas,
) {

  if $manage_repo {
    class { 'elasticsearch::repo': }
    -> class { 'elasticsearch::install': }
    -> class { 'elasticsearch::config': }
    ~> class { 'elasticsearch::service': }

    contain elasticsearch::repo
    contain elasticsearch::install
    contain elasticsearch::config
    contain elasticsearch::service
  }

  else {
    class { 'elasticsearch::install': }
    -> class { 'elasticsearch::config': }
    ~> class { 'elasticsearch::service': }

    contain elasticsearch::install
    contain elasticsearch::config
    contain elasticsearch::service
  }

}
