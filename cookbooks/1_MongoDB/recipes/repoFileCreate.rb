#
# Cookbook:: 1_MongoDB
# Recipe:: repoFileCreate
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Create a /etc/yum.repos.d/mongodb.repo file to hold the following configuration information for the MongoDB repository:
# If you are running a 64-bit system, use the following configuration:
# [mongodb]
# name=MongoDB Repository
# baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
# gpgcheck=0
# enabled=1
# If you are running a 32-bit system, which is not recommended for production deployments, use the following configuration:
# [mongodb]
# name=MongoDB Repository
# baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/i686/
# gpgcheck=0
# enabled=1

template '/etc/yum.repos.d/mongodb.repo' do
  case node['kernel']['machine']
  when 'i68'
    source 'mongodb-org.repo-i68.erb'
  when 'x86_64'
    source 'mongodb-org.repo-x86_64.erb'
  else
    Chef::Log.error("I don't understand your machine arch yet: #{node['kernel']['machine']}")
  end
  action :create
end

# We can use file resource also
# file '/etc/yum.repos.d/mongodb.repo' do
#   case node['kernel']['machine']
#   when 'i68'
#     content '
# [mongodb-org-5.0]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/5.0/i68/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc'
#   when 'x86_64'
#     content '
# [mongodb-org-5.0]
# name=MongoDB Repository
# baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/5.0/x86_64/
# gpgcheck=1
# enabled=1
# gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc'
#   else
#     Chef::Log.error("I don't understand your arch yet: #{node['kernel']['machine']}")
#   end
#   action :create
# end
