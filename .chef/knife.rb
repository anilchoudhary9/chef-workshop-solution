# See http://docs.chef.io/workstation/config_rb/ for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "anilchoudhary09"
validation_client_name   'chef-workshop-anil-validator'
validation_key           "chef-workshop-anil-validator.pem"
client_key               "#{current_dir}/anilchoudhary09.pem"
chef_server_url          "https://api.chef.io/organizations/chef-workshop-anil"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
