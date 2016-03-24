require 'spec_helper'
describe "grahamconfig::config" do
let(:my_homedir) { '/Users/grahamgilbert' }
let(:my_username) { 'grahamgilbert' }
it { should compile }
# it do
#     should contain_file('/etc/meraki').with({
#       'ensure' => 'directory',
#     })
# end
end
