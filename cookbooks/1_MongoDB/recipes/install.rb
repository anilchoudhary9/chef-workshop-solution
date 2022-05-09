#
# Cookbook:: 1_MongoDB
# Recipe:: install
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install the MongoDB packages and associated tools.
# sudo yum install mongodb-org
package 'mongodb-org' do
  version '4.4.4'
  action :install
end

# We can individually install all mongodb packages
# ['mongodb-org-4.4.14 mongodb-org-server-4.4.14 mongodb-org-shell-4.4.14 mongodb-org-mongos-4.4.14 mongodb-org-tools-4.4.14'].each do |p|
#   package p do
#     action :install
#   end
# end
