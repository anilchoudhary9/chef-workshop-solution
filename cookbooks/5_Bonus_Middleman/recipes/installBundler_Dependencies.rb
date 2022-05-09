#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: installBundler_Dependencies
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install project dependencies

# Make /home/apache writable
directory '/home/apache' do
  mode '0757'
  action :create
end

# make working directory for bundle install
directory '/home/apache/.bundle/cache/compact_index' do
  mode '1777'
  recursive true
  owner 'apache'
  action :create
  not_if { ::File.exist?('/home/apache/.bundle/cache/compact_index') }
end

# make working directory for bundle install
directory '/tmp' do
  mode '1777'
  recursive true
  action :create
end

# Install Middleman blog repository
# git clone https://github.com/learnchef/middleman-blog.git
git '/home/apache/middleman-blog' do
  repository 'https://github.com/learnchef/middleman-blog.git'
  revision 'master'
  user 'apache'
  action :checkout
  not_if { ::File.exist?('/home/apache/middleman-blog') }
end

# Install Bundler
# gem install bundler
gem_package 'bundler' do
  version '1.16.1'
  action :install
  not_if { ::File.exist?('/usr/local/lib/ruby/gems/2.1.0/gems/bundler-1.16.1') }
end

# Create apache user
user 'apache' do
  manage_home true
  comment 'Apache User'
  home '/home/apache'
  shell '/bin/bash'
  password 'apache'
end

sudo 'apache' do
  user 'apache'
  nopasswd true
end

# bundle install
execute 'bundle_install' do
  command 'bundle install'
  environment 'tmpdir' => '/tmp'
  cwd '/home/apache/middleman-blog'
  user 'apache'
end

# establish configuration file
template '/etc/blog.yml' do
  source 'blog.yml.erb'
  variables project_install_directory: '/var/www/middleman'
  # action :create_if_missing
end
