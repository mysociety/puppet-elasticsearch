require 'spec_helper'

describe 'elasticsearch::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with defaults' do
        let(:pre_condition) { 'include elasticsearch' }

        it do
          is_expected.to compile
          is_expected.to contain_package('elasticsearch').with('ensure' => 'installed')
        end
      end

      context 'with ensure => 0.90.13' do
        let(:pre_condition) { 'class { "elasticsearch": package_ensure => "0.90.13" }' }

        it do
          is_expected.to compile
          is_expected.to contain_package('elasticsearch').with('ensure' => '0.90.13')
        end
      end
    end
  end
end
