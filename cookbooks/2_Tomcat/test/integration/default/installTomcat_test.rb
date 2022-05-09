# Chef InSpec test for recipe 2_Tomcat::installTomcat

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

# check for existance of tomcat server
describe file('/opt/tomcat') do
  it { should exist }
  it { should be_directory }
end

# make sure that the download is successful
describe file('/tmp/apache-tomcat-8.5.78.tar') do
  it { should exist }
end

# check if tomcat group exists
describe group('tomcat') do
  it { should exist }
end

# check if tomcat group exists
describe user('tomcat') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

# check group permissions
describe file('/opt/tomcat/conf') do
  it { should exist }
  its('owner') { should eq 'root' }
  its('mode') { should cmp '0650' }
end

# check file permissions on specific directories
%w( webapps work temp logs ).each do |path|
  describe file("/opt/tomcat/#{path}") do
    it { should exist }
    it { should be_owned_by 'tomcat' }
  end
end
