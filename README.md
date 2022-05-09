

# Overview

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops
- 1_MongoDB - https://github.com/chef-cft/workshops/tree/master/1_MongoDB
- 2_Tomcat - https://github.com/chef-cft/workshops/tree/master/2_Tomcat
- 3_Bonus : 
  - Awesome_Appliance_Repair - https://github.com/chef-cft/workshops/tree/master/3_Bonus/Awesome_Appliance_Repair
  - Middleman - https://github.com/chef-cft/workshops/tree/master/3_Bonus/Middleman
- 4_Windows - https://github.com/chef-cft/workshops/tree/master/4_Windows

## Instructions to run the cookbooks
### Prerequisites
- Chef Workstation install.
- Virtualization software like VirtualBox and Vagrant.
- Git install

#### Clone this repository - 

### Running cookbooks
#### On Local machine using Test Kitchen via Vagrant and Virtual Box
- Goto directory: chef-workshop-solution/cookbooks/`<cookbook_name>`
- run command: `kitchen converge` => this will start an VM and run the recipe to it treating it as a target machine
- run command to run inspec test cases: `kitchen verify`
- run command to login to the created VM: `kitchen login`
- on successfull verification of execution
- type exit to come out from logged-in session
- run command to stop running VM: `kitchen destory`

#### Using chef-client - On target RHEL based instance
- Goto directory: chef-workshop-solution/cookbooks/`<cookbook_name>`
-run command: sudo chef-client --local-mode `<cookbook-name>` => this will run the desire cookbook `recipe` according to set `run list`
-verify the successfull execution of cookbook. 

### Method to verify successfull cookbook execution
#### 1_MongoDB cookbook :
- on VM or client, run command to check the proper installtion of mongdo db: mongodb => this would open mongodb console

#### 2_Tomcat cookbook :
- on VM or client, run command to check the proper installtion of tomcat: curl http://localhost:8080 => this would display the default Tomcat html code on the console

#### 3_Windows cookbook :
- on VM or client, check the remdiatation of all required controls is happened.

#### 4_Bonus_Awesome_Appliance_Repair cookbook :
- interact with the Awesome Appliance Repair site in a browser.

#### 4_Middleman cookbook :
- interact with the middleman site in a browser.
- Login into the deployed instance utilizing kitchen login
- Change directory /home/apache/middleman-blog
- Run 'sudo middleman server'
- From your local browser enter the following
http://0.0.0.0:4567 to produce browser output

## Repository Directories

This repository contains several directories, and each directory contains a README file that describes what it is for in greater detail, and how to use it for managing your systems with Chef.

- `cookbooks/` - Cookbooks you download or create.
- `data_bags/` - Store data bags and items in .json in the repository.
- `roles/` - Store roles in .rb or .json in the repository.
- `environments/` - Store environments in .rb or .json in the repository.

## Configuration

The config file, `.chef/config.rb` is a repository-specific configuration file for the knife command line tool. If you're using the Hosted Chef platform, you can download one for your organization from the management console. You can also generate a new config.rb by running `knife configure`. For more information about configuring Knife, see the Knife documentation at https://docs.chef.io/workstation/knife/

## Next Steps

Read the README file in each of the subdirectories for more information about what goes in those directories.
