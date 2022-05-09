#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: installGit
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install Git
# apt-get install git
apt_package 'git'

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
