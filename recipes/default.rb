#
# Cookbook Name:: loganov-jenkins
# Recipe:: default
#
# Copyright 2014, Loganov Industries
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jenkins::master'

jenkins_plugin 'greenballs' do
	action :install
end

jenkins_plugin 'ant' do
	action :uninstall
end

jenkins_plugin 'scm-sync-configuration' do
	action :install
end

#jenkins_user 'gweaver' do
#  full_name    'Gregory Weaver'
#  email        'gw@loganov.com'
#  public_keys  ['tbd']
#end
