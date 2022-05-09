# 4_Bonus_Awesome_Appliance_Repair

Awesome Appliance Repair is a sample web application written in Python. The application includes instructions for installing and initializing the application on Ubuntu using MySQL as the database and Apache as the web server.

# Goal
Use Chef to successfully install and configure the Awesome Appliance Repair application and database on an Ubuntu-based target system.

# Overview

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops
- 3_Bonus : 
  - Awesome_Appliance_Repair - https://github.com/chef-cft/workshops/tree/master/3_Bonus/Awesome_Appliance_Repair

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

#### 4_Bonus_Awesome_Appliance_Repair cookbook :
- interact with the Awesome Appliance Repair site in a browser.
