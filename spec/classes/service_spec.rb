require 'spec_helper'

describe 'elasticsearch::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it do
        is_expected.to compile
        is_expected.to contain_service('elasticsearch') \
          .with(
            'ensure' => 'running',
            'enable' => true,
          )
      end
    end
  end
end
