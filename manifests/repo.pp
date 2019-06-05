#
# @summary Set up the APT repositories for elasticsearch
#
# Set's up APT repos for Elasticsearch based on teh required version
# and ensures the GPG signing key is imported.
#
# @param version
#   The required version of elasticsearch to install
#
# @example
#   class { 'elasticsearch::repo':
#     version => '0.90',
#   }
#
class elasticsearch::repo (
  Enum['0.90', '1'] $version = $elasticsearch::version,
) {

  case $version {
    '0.90': {
      $repo_url       = 'https://packages.elastic.co/elasticsearch/0.90/debian'
      $allow_unsigned = true
    }
    '1': {
      $repo_url       = 'https://packages.elastic.co/elasticsearch/1.7/debian'
      $allow_unsigned = true
    }
  }

  apt::key { 'elasticsearch':
    id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
    server => 'hkps.pool.sks-keyservers.net',
  }

  -> apt::source { 'elasticsearch':
    location       => $repo_url,
    release        => 'stable',
    repos          => 'main',
    allow_unsigned => $allow_unsigned,
  }

}
