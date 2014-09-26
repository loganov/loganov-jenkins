#
# Cookbook Name:: loganov-jenkins
# Recipe:: default
#
# Copyright 2014, Loganov Industries
#
# All rights reserved - Do Not Redistribute
#

#rvm jenkins plugin
#rvm + ruby 

include_recipe 'loganov-jenkins::default'
include_recipe 'loganov-vagrant'

gem_package 'berkshelf' do
	action :install
end

gem_package 'test-kitchen' do
	action :install
end

packagecloud_repo "chef/stable" do
  type "rpm"
end

#if ::File.exists?(new_resource.config)
  package 'chefdk'
#else
#	raise Chef::Exceptions::FileNotFound, "Packagecloud Chef repo is not present."
#end