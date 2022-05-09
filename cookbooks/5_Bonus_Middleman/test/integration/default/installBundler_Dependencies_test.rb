# Chef InSpec test for recipe 5_Bonus_Middleman::installBundler_Dependencies

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

# Validate that middleman blog exists
describe file('/home/apache/middleman-blog') do
  it { should exist }
end

# Validate that gem bundler has been installed
describe file('/usr/local/lib/ruby/gems/2.1.0/gems/bundler-1.16.1') do
  it { should exist }
  its('mode') { should cmp '0755' }
end
