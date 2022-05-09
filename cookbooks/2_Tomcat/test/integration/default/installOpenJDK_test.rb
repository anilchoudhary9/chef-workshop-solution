# Chef InSpec test for recipe 2_Tomcat::installOpenJDK

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

# My test
# Java should be installed
describe package('java-1.7.0-openjdk-devel') do
  it { should be_installed }
end

# Validate java installation is present
describe file('/usr/bin/java') do
  it { should exist }
end
