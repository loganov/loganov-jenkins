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
    source 'hudson.model.updateCeneter.xml.erb'
end

#git config --global user.email "you@example.com"
#git config --global user.name "Your Name"

jenkins_plugin 'greenballs' do
    action :install
end

jenkins_plugin 'ant' do
    action :uninstall
end

jenkins_plugin 'scm-sync-configuration' do
    action :install
end

#http://updates.jenkins-ci.org/update-center.json

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
