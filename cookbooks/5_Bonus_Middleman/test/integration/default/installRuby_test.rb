# Chef InSpec test for recipe 5_Bonus_Middleman::installRuby

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

# Validate that ruby has been created
describe file('/usr/local/bin/ruby') do
  it { should exist }
end

# Validate that gem has been created
describe file('/usr/local/bin/gem') do
  it { should exist }
end

# Validate that rudy working directory has been created
describe file('/home/vagrant/ruby') do
  it { should_not exist }
end

# Validate that ruby has been installed
describe file('/usr/bin/ruby') do
  it { should exist }
  its('mode') { should cmp '0755' }
end

# Validate that gem has been installed
describe file('/usr/bin/gem') do
  it { should exist }
  its('mode') { should cmp '0755' }
end
