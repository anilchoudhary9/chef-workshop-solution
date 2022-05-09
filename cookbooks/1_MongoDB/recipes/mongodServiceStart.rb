#
# Cookbook:: 1_MongoDB
# Recipe:: mongodServiceStart
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# sudo service mongod start
service 'mongod' do
  action [:enable, :start]
end
