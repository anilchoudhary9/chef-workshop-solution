#
# Cookbook:: 2_Tomcat
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

#  Note -  We can also mainitain the run list for the cookbook to do the same below include recipe method.

include_recipe '2_Tomcat::installOpenJDK'

include_recipe '2_Tomcat::installTomcat'

include_recipe '2_Tomcat::tomcatServiceEnable'
