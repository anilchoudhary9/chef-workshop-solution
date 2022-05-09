# 5_Bonus_Middleman

Middleman is a static site generator using all the shortcuts and tools in modern web development. It is a ruby (sinatra) application.

# Goal
Use Chef to successfully install and configure the middleman application

# Overview

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops
- 3_Bonus : 
  - Awesome_Appliance_Repair - https://github.com/chef-cft/workshops/tree/master/3_Bonus/Awesome_Appliance_Repair
  - Middleman - https://github.com/chef-cft/workshops/tree/master/3_Bonus/Middleman

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
#### 4_Middleman cookbook :
- interact with the middleman site in a browser.
- Login into the deployed instance utilizing kitchen login
- Change directory /home/apache/middleman-blog
- Run 'sudo middleman server'
- From your local browser enter the following
http://0.0.0.0:4567 to produce browser output
