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

This directory contains the cookbooks used to configure systems in your infrastructure with Chef Infra - an MongoDb install on RHEL system, Tomcat Install on RHEL and Task perform on windows service 2016 cookbook called `1_MongoDB` `2_Tomcat` `3_Windows 4_Bonus_Awesome_Appliance_Repair 5_Bonus_Middleman` has been automatically created for you.

Knife needs to be configured to know where the cookbooks are located with the `cookbook_path` setting. If this is not set, then several cookbook operations will fail to work properly.

```
cookbook_path ["./cookbooks"]
```

This setting tells knife to look for the cookbooks directory in the present working directory. This means the knife cookbook subcommands need to be run in the `chef-workshop` directory itself. To make sure that the cookbooks can be found elsewhere inside the repository, use an absolute path. This is a Ruby file, so something like the following can be used:

```
current_dir = File.dirname(__FILE__)
cookbook_path ["#{current_dir}/../cookbooks"]
```

Which will set `current_dir` to the location of the config.rb (previously knife.rb) file itself (e.g. `~/chef-workshop/.chef/config.rb`).

Configure knife to use your preferred copyright holder, email contact and license. Add the following lines to `.chef/config.rb`.

```
cookbook_copyright "Anil Choudhary"
cookbook_email     "anilchoudhary0954@gmail.com"
cookbook_license   "apachev2"
```

Supported values for `cookbook_license` are "apachev2", "mit","gplv2","gplv3", or "none". These settings are used to prefill comments in the default recipe, and the corresponding values in the metadata.rb. You are free to change the comments in those files.

Create new cookbooks in this directory with Chef.

```
chef generate cookbook COOKBOOK
```

This will create all the cookbook directory components. You don't need to use them all, and can delete the ones you don't need. It also creates a README file, metadata.rb and default recipe.

You can also download cookbooks directly from the Chef Supermarket site. There are two subcommands to help with this depending on what your preference is.

The first and recommended method is to use a vendor branch if you're using Git. This is automatically handled with Knife.

```
knife cookbook site install COOKBOOK
```

This will:

- Download the cookbook tarball from the Chef Supermarket.
- Ensure its on the git master branch.
- Checks for an existing vendor branch, and creates if it doesn't.
- Checks out the vendor branch (chef-vendor-COOKBOOK).
- Removes the existing (old) version.
- Untars the cookbook tarball it downloaded in the first step.
- Adds the cookbook files to the git index and commits.
- Creates a tag for the version downloaded.
- Checks out the master branch again.
- Merges the cookbook into master.
- Repeats the above for all the cookbooks dependencies, downloading them from the community site

The last step will ensure that any local changes or modifications you have made to the cookbook are preserved, so you can keep your changes through upstream updates.

If you're not using Git, use the site download subcommand to download the tarball.

```
knife cookbook site download COOKBOOK
```

This creates the COOKBOOK.tar.gz from in the current directory (e.g., `~/chef-workshop`). We recommend following a workflow similar to the above for your version control tool.

I had used Kitchen with Vagrant to test all the cookbooks
