# Chef InSpec test for recipe 1_MongoDB::repoFileCreate

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe file('/etc/yum.repos.d/mongodb.repo') do
  it { should exist }
  it { should be_readable }
  its('content') { should match 'MongoDB Repository' }
  # its('content') { should match '5.0' }
  its('content') { should match 'gpgcheck' }
  its('content') { should match 'enabled' }
  its('content') { should match 'gpgkey' }
end
