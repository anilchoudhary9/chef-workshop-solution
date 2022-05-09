# Chef InSpec test for recipe 2_Tomcat::tomcatServiceEnable

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe port(8080), :skip do
  it { should_not be_listening }
end

# check on the status of Tomcat service
describe service('tomcat') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('curl http://localhost:8080') do
  its('stdout') { should match(/Tomcat/) }
end
