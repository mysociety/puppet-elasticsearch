require 'spec_helper'

describe 'elasticsearch::repo' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with version => 0.90' do
        let(:pre_condition) { 'class { "elasticsearch": version => "0.90" }' }

        it do
          is_expected.to compile
          is_expected.to contain_apt__key('elasticsearch') \
            .with(
              'id'     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
              'server' => 'hkps.pool.sks-keyservers.net',
            )
          is_expected.to contain_apt__source('elasticsearch') \
            .with(
              'location'       => 'https://packages.elastic.co/elasticsearch/0.90/debian',
              'allow_unsigned' => true,
            )
        end
      end

      context 'with verstion => 1' do
        let(:pre_condition) { 'class { "elasticsearch": version => "1" }' }

        it do
          is_expected.to compile
          is_expected.to contain_apt__key('elasticsearch') \
            .with(
              'id'     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
              'server' => 'hkps.pool.sks-keyservers.net',
            )
          is_expected.to contain_apt__source('elasticsearch') \
            .with(
              'location'       => 'https://packages.elastic.co/elasticsearch/1.7/debian',
              'allow_unsigned' => true,
            )
        end
      end
    end
  end
end
