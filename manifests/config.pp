#
# @summary Ensures Elasticsearch is configured
#
# Configures Elasticsearch
#
# @example
#   include elasticsearch::config
#
class elasticsearch::config (
  Enum['0.90', '1'] $version      = $elasticsearch::version,
  String $cluster_name            = $elasticsearch::cluster_name,
  String $node_name               = $elasticsearch::node_name,
  String $heap_size               = $elasticsearch::heap_size,
  String $max_locked_memory       = $elasticsearch::max_locked_memory,
  String $bootstrap_mlockall      = $elasticsearch::bootstrap_mlockall,
  String $http_max_content_length = $elasticsearch::http_max_content_length,
  Integer $number_of_shards       = $elasticsearch::number_of_shards,
  Integer $number_of_replicas     = $elasticsearch::number_of_replicas,
){

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => 'file',
    content => template('elasticsearch/etc/elasticsearch/elasticsearch.yml.erb'),
  }

  file { '/etc/default/elasticsearch':
    ensure  => 'file',
    content => template("elasticsearch/etc/default/elasticsearch-${version}.erb"),
  }

}
