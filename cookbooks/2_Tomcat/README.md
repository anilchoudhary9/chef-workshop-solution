# 2_Tomcat

Cookbook to Install and Configure Apache Tomcat

The Chef repository contains the chef cookbooks having the solutions for chef workshop exercises at https://github.com/chef-cft/workshops
- 2_Tomcat - https://github.com/chef-cft/workshops/tree/master/2_Tomcat

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
#### 2_Tomcat cookbook :
- on VM or client, run command to check the proper installtion of tomcat: curl http://localhost:8080 => this would display the default Tomcat html code on the console

#### Requirnments:
1. Configure Chef-Workstation, Chef-server (can use chef hosted server or the standalone chef-server), Chef-Client VM or cloud machine
2. Chef-Workstation should able to connect to Chef-Server and  Chef-Clients

#### Chef-Zero test run results for cookbook
$ cookstyle 2_Tomcat
[chef-workstation@chef-workstation cookbooks]$ cookstyle 2_Tomcat
Inspecting 6 files
......

6 files inspected, no offenses detected

##### -->Chef kitchen test results:
chef-client --local-mode --why-run 2_Tomcat::default.rb

INFO: Started Chef Infra Zero at chefzero://localhost:1 with repository at /home/chef-workstation/Desktop/Chef-Workstation/chef-workshop
  One version per cookbook

Starting Chef Infra Client, version 15.14.0
INFO: *** Chef Infra Client 15.14.0 ***
INFO: Platform: x86_64-linux
INFO: Chef-client pid: 27599
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
WARN: Node anilchoudhary09 has an empty run list 
<!-- We can use the runlist though for this cookbook runlist is not used as single recipe -->
Converging 14 resources
Recipe: @recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb
  * dnf_package[java] action install INFO: Processing dnf_package[java] action install (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 7)

    - Would install version java-1.7.0-openjdk-devel of package java
  * group[tomcat] action create INFO: Processing group[tomcat] action create (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 12)

    - Would create group tomcat
  * linux_user[tomcat] action create INFO: Processing linux_user[tomcat] action create (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 16)

    - Would create user tomcat
  * execute[download] action run INFO: Processing execute[download] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 24)

    - Would execute wget http://apache.cs.utah.edu/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz
  * ruby_block[Create Directory] action run INFO: Processing ruby_block[Create Directory] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 36)

    - Would execute the ruby block Create Directory
  * archive_file[apache-tomcat-8*tar.gz] action extract INFO: Processing archive_file[apache-tomcat-8*tar.gz] action extract (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 46)

    - Would create directory /opt/tomcat
    - Would extract /tmp to /opt/tomcat
  * directory[/opt/tomcat] action nothing INFO: Processing directory[/opt/tomcat] action nothing (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 53)
 (skipped due to action :nothing)
  * execute[change_mode] action run[] INFO: Processing execute[change_mode] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 66)

    - Would execute chmod -R g+r conf
  * execute[change_mode] action run INFO: Processing execute[change_mode] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 71)

    - Would execute chmod g+x conf
  * execute[change_mode] action run INFO: Processing execute[change_mode] action run (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 76)

  - Would copy file [tomcat.service] to [/etc/systemd/system/tomcat.service] 
  * cookbook_file[/etc/systemd/system/tomcat.service] action create INFO: Processing cookbook_file[/etc/systemd/system/tomcat.service] action create (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 81)

    - Would execute chown -R tomcat webapps/ work/ temp/ logs/
  * systemd_unit[daemon-reload] action nothing INFO: Processing systemd_unit[daemon-reload] action nothing (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 95)
 (skipped due to action :nothing)
  * systemd_unit[tomcat] action start INFO: Processing systemd_unit[tomcat] action start (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 104)

    - Would starting unit: tomcat
  * systemd_unit[tomcat] action enable INFO: Processing systemd_unit[tomcat] action enable (@recipe_files::/home/chef-workstation/Desktop/Chef-Workstation/chef-workshop/cookbooks/2_Tomcat/recipes/default.rb line 108)

    - Would enabling unit: tomcat
WARN: In why-run mode, so NOT performing node save.
INFO: Chef Infra Client Run complete in 3.19873962 seconds

Running handlers:
INFO: Running report handlers
Running handlers complete
INFO: Report handlers complete
Chef Infra Client finished, 14/14 resources would have been updated

Success Criteria completed:
Done : Your Chef cookbook successfully executes on your target node without errors
Done : Your Chef cookbook is portable and can be run by Chef to validate your work. Please include any      instructions or assumptions needed to successfully execute your cookbook.
Done : You can interact with the default tomcat site in a browser or successfully curl localhost on the target system
Done : You can run chef-client multiple times without failures
Done : Your GitHub.com source code repository shows the history of your work
Done : You should be able to explain the following:
        Steps taken to achieve the end result
        Build and test process of Chef code
        Tools and resources used in the process

#### --> $ curl http://localhost:8080
giving correct Tomcat running status

