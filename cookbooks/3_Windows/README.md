# 3_Windows

Install Windows 2019 Server
Use Chef to successfully detect and remediate controls listed in attached Microsoft_Windows_Server_2019_Security_Benchmark.pdf file.

Table of Contents completed:
Done - (L1) Ensure 'Allow log on locally' is set to "Administrators’ (Scored)
Done - (L1) Ensure 'Allow log on through Remote Desktop Services' is set to ‘Administrators, Remote
Desktop Users' (MS 0nly) (SCOred)
Done - (L1) Ensure 'Accounts: Administrator account status' is set to ‘Disabled’ (MS only) (Scored)
Done - (L) Ensure ‘Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled" (Scored)
Done - (L2) Ensure 'Enable Windows NTP Client'is set to 'ENabled’ (SCOred)
Done - (L2) Ensure 'Enable Windows NTP Server is set to 'Disabled" (MS only) (SCored)

# Overview

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops

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

#### 3_Windows cookbook :
- on VM or client, check the remdiatation of all required controls is happened.
