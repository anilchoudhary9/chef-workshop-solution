#
# Cookbook:: 4_Bonus_Awesome_Appliance_Repair
# Recipe:: app
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Location of zip file
repo_source = node.default['4_Bonus_Awesome_Appliance_Repair']['repo_source']

# Grabs zip file from source location
remote_file "#{Chef::Config[:file_cache_path]}/master.zip" do
  source repo_source
  owner 'root'
  mode '0644'
  action :create_if_missing
end

# Unzip the package
archive_file 'master.zip' do
  path "#{Chef::Config[:file_cache_path]}/master.zip"
  destination '/var/www/'
  action :extract
end

# Make sure script has execute permissions
# execute 'chmod_script_file' do
#  cwd '/Awesome-Appliance-Repair-Master'
#  command "chmod +x #{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']}"
# end

file "/Awesome-Appliance-Repair-Master/#{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']}" do
  mode '777'
end

# MySQL password
mysql_pass = node.default['4_Bonus_Awesome_Appliance_Repair']['mysql_root_pass']

# Execute installer script
execute "./#{node.default['4_Bonus_Awesome_Appliance_Repair']['script_to_run']} #{mysql_pass}" do
  cwd '/Awesome-Appliance-Repair-Master'
end

# execute
execute 'apachectl graceful'

# execute 'run_init_script' do
#  command 'python /Awesome-Appliance-Repair-Master/AARinstall.py password'
# end
