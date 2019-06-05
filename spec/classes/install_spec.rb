require 'spec_helper'

describe 'elasticsearch::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it do
        is_expected.to compile
        is_expected.to contain_package('elasticsearch').with('ensure' => 'installed')
      end
    end
  end
end
