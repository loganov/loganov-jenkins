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


case node['platform']
when 'centos', 'redhat', 'amazon', 'scientific'
  yumgroup "Development Tools" do
      action :install 
  end
end

#packagecloud_repo "chef/stable" do
#  type "rpm"
#end

cookbook_file 'RPM-GPG-KEY-packagecloud' do
    path '/etc/pki/rpm-gpg/RPM-GPG-KEY-packagecloud'
    mode '0644'
end

yum_repository 'packagecloud' do
    baseurl 'https://packagecloud.io/chef/stable/el/6/$basearch'
    gpgcheck true
    gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-packagecloud'
    sslverify false
    failovermethod 'priority'
    enabled true
    action :create
end

#if ::File.exists?('/etc/yum.repos.d/packagecloud.repo')
  package 'chefdk'
#else
#	raise Chef::Exceptions::FileNotFound, "Packagecloud Chef repo is not present."
#end
