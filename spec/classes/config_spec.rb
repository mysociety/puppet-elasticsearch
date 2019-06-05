require 'spec_helper'

describe 'elasticsearch::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include elasticsearch' }

      it do
        is_expected.to compile
        is_expected.to contain_file('/etc/default/elasticsearch')
        is_expected.to contain_file('/etc/elasticsearch/elasticsearch.yml')
      end
    end
  end
end
