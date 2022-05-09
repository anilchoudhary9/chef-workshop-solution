#
# Cookbook:: 2_Tomcat
# Recipe:: installOpenJDK
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# Install Java
package 'java-1.7.0-openjdk' do
  action :install
end
