#
# Cookbook:: 5_Bonus_Middleman
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

# apt-get update
apt_update 'update'

include_recipe '5_Bonus_Middleman::installRuby'

include_recipe '5_Bonus_Middleman::installApache'

include_recipe '5_Bonus_Middleman::installGit'

include_recipe '5_Bonus_Middleman::installBundler_Dependencies'

include_recipe '5_Bonus_Middleman::thin'
