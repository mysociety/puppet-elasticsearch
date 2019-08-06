require 'spec_helper'

describe 'elasticsearch' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with defaults' do
        it do
          is_expected.to compile
          is_expected.to contain_class('elasticsearch::repo')
          is_expected.to contain_class('elasticsearch::install')
          is_expected.to contain_class('elasticsearch::config')
          is_expected.to contain_class('elasticsearch::service')
        end
      end
      context 'with manage_repo => false' do
        let(:pre_condition) { 'class { "elasticsearch": manage_repo => false }' }

        it do
          is_expected.to compile
          is_expected.not_to contain_class('elasticsearch::repo')
          is_expected.to contain_class('elasticsearch::install')
          is_expected.to contain_class('elasticsearch::config')
          is_expected.to contain_class('elasticsearch::service')
        end
      end
    end
  end
end
