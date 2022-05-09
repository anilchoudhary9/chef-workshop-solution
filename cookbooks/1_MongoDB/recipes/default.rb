#
# Cookbook:: 1_MongoDB
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

#  Note -  We can also mainitain the run list for the cookbook to do the same below include recipe method.

include_recipe '1_MongoDB::repoFileCreate'

include_recipe '1_MongoDB::install'

include_recipe '1_MongoDB::mongodServiceStart'
