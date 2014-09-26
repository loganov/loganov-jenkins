#
# Cookbook Name:: loganov-jenkins
# Recipe:: default
#
# Copyright 2014, Loganov Industries
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jenkins::master'

template "#{node['jenkins']['home']}/hudson.model.UpdateCenter.xml" do
    source 'hudson.model.updateCenter.xml.erb'
end

template "#{node['jenkins']['home']}/hudson.plugins.git.GitSCM.xml" do
    source 'hudson.plugins.git.GitSCM.xml.erb'
end

jenkins_plugin 'greenballs' do
    action :install
end

jenkins_plugin 'scm-sync-configuration' do
    action :install
end

jenkins_plugin 'git' do
    action :install
end

jenkins_plugin 'github' do
    action :install
end

#jenkins_user 'gweaver' do
#  full_name    'Gregory Weaver'
#  email        'gw@loganov.com'
#  public_keys  ['tbd']
#end
