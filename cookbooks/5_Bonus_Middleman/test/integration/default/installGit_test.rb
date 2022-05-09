# Chef InSpec test for recipe 5_Bonus_Middleman::installGit

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

# Validate that git has been installed
describe file('/usr/bin/git') do
  it { should exist }
  its('mode') { should cmp '0755' }
end

# Validate that apache2 has been installed
describe file('/etc/apache2/apache2.conf') do
  it { should exist }
end

# Validate that apache2 configuration file proxy_load has been installed
describe file('/etc/apache2/mods-enabled/proxy_http.load') do
  it { should exist }
end

# Validate that apache2 configuration file rewrite has been installed
describe file('/etc/apache2/mods-enabled/rewrite.load') do
  it { should exist }
end

# Validate that apache2 configuration file rewrite has been installed
describe file('/etc/apache2/sites-enabled/blog.conf') do
  it { should exist }
end

# Validate that apache2 configuration file rewrite has been installed
describe file('/etc/apache2/sites-enabled/000-default.conf') do
  it { should_not exist }
end
