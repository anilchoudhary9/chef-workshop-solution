# 1_MongoDB

Install MongoDB on chef-client nodes

**Overview**
Cookbook for installing and configuring mongodb

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops
- 1_MongoDB - https://github.com/chef-cft/workshops/tree/master/1_MongoDB

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

#### Requirements:
1. Configure Chef-Workstation, Chef-server (can use chef hosted server or the standalone chef-server), Chef-Client VM or cloud machine
2. Chef-Workstation should able to connect to Chef-Server and  Chef-Clients

#### Chef-Zero test run results for cookbook
[chef-workstation@chef-workstation cookbooks]$ cookstyle 1_MongoDB/
Inspecting 7 files
.......

7 files inspected, no offenses detected

#### -->Chef kitchen test results:

INFO: Started Chef Infra Zero at chefzero://localhost:1 with repository at /home/chef-workstation/Desktop/Chef-Workstation/chef-workshop
  One version per cookbook

Starting Chef Infra Client, version 15.14.0
INFO: *** Chef Infra Client 15.14.0 ***
INFO: Platform: x86_64-linux
INFO: Chef-client pid: 28537
ERROR: shard_seed: Failed to get dmi property serial_number: is dmidecode installed?
INFO: Run List is []
INFO: Run List expands to []
INFO: Starting Chef Infra Client Run for anilchoudhary09
INFO: Running start handlers
INFO: Start handlers complete.
resolving cookbooks for run list: []
INFO: Loading cookbooks []
Synchronizing Cookbooks:
Installing Cookbook Gems:
Compiling Cookbooks...
ERROR: I don't understand your arch yet: 
WARN: Node anilchoudhary09 has an empty run list.
<!-- No run list added as single recipe file -->
Converging 4 resources
Recipe: @recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/1_mongodb/recipes/install.rb
  * file[/etc/yum.repos.d/mongodb-org-5.0.repo] action create INFO: Processing file[/etc/yum.repos.d/mongodb-org-5.0.repo] action create (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/1_mongodb/recipes/install.rb line 20)

    - Would create new file /etc/yum.repos.d/mongodb-org-5.0.repo
    - Would change mode from '' to '0755'
    - Would restore selinux security context
  * dnf_package[mongodb-org] action install INFO: Processing dnf_package[mongodb-org] action install (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/1_mongodb/recipes/install.rb line 43)

    * No candidate version available for mongodb-org
    * Latest version of mongodb-org would have been installed
  * service[mongod] action start INFO: Processing service[mongod] action start (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/1_mongodb/recipes/install.rb line 54)

    * Service status not available. Assuming a prior action would have installed the service.
    * Assuming status of not running.
    - Would start service service[mongod]
  * execute[check config mongodb] action run INFO: Processing execute[check config mongodb] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/1_mongodb/recipes/install.rb line 67)

    - Would execute sudo chkconfig mongod on
WARN: In why-run mode, so NOT performing node save.
INFO: Chef Infra Client Run complete in 3.660193159 seconds

Running handlers:
INFO: Running report handlers
Running handlers complete
INFO: Report handlers complete
Chef Infra Client finished, 4/4 resources would have been updated

Success Criteria completed:
Done : Your Chef cookbook successfully executes on your target node without errors
Done : Your Chef cookbook is portable and can be run by Chef to validate your work. Please include any      instructions or assumptions needed to successfully execute your cookbook.
Done : You can login to MongoDB by typing mongo on the target system
Done : You can run chef-client multiple times without failures
Done : Your GitHub.com source code repository shows the history of your work
Done : You should be able to explain the following:
        Steps taken to achieve the end result
        Build and test process of Chef code
        Tools and resources used in the process

#### --> On chef-client node the MongoDB is successfuly install

