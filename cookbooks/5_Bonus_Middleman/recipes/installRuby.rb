#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: installRuby
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# %w( build-essential libssl-dev libyaml-dev libreadline-dev openssl curl git-core zlib1g-dev bison libxml2-dev libxslt1-dev libcurl4-openssl-dev nodejs libsqlite3-dev sqlite3 ).each do |packages|
#   package "#{packages}" do
#     action :install
#   end
# end

package 'ruby-full' do
  action :install
end

# make working directory
directory 'ruby' do
  mode '0755'
  action :create
end

# download tarball
# wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz
remote_file '/ruby/ruby-2.1.3.tar.gz' do
  source 'http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz'
end

# extract tarball to /home/vagrant/ruby
# archive_file 'ruby-2.1.3.tar.gz' do
#   path '/home/vagrant/ruby/ruby-2.1.3.tar.gz'
#   destination '/home/vagrant/ruby'
#   action :extract
# end

execute 'extract_ruby' do
  command 'sudo tar -xzf ruby-2.1.3.tar.gz --strip-components=1'
  cwd '/ruby'
end

directory '/usr/bin/ruby' do
  mode '0755'
  action :create
end

# Build ruby
# cd ruby-2.1.3 & ./configure & make install
execute 'build_ruby' do
  command 'sudo ./configure'
  cwd '/ruby'
end

execute 'build_ruby' do
  command 'sudo make install'
  cwd '/ruby'
end

# rm -rf ~/ruby
directory '/ruby' do
  recursive true
  action :delete
end

# cp /usr/local/bin/ruby /usr/bin/ruby
file '/usr/bin/ruby' do
  owner 'root'
  group 'root'
  mode '0755'
  lazy { content ::File.read('/usr/local/bin/ruby') }
  action :create
  only_if { ::File.exist?('/usr/local/bin/ruby') }
end

# cp /usr/local/bin/gem /usr/bin/gem
file '/usr/bin/gem' do
  owner 'root'
  group 'root'
  mode '0755'
  lazy { content ::File.read('/usr/local/bin/gem') }
  action :create
  only_if { ::File.exist?('/usr/local/bin/gem') }
end
