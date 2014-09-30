# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :digital_ocean do |provider, override|
    
    # set to /etc/digitalocean/id_rsa
    # or...leave as is. place in JENKINS_HOME
    override.ssh.private_key_path = '~/.ssh/vagrant'
    
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    # These environment variables will be set by Jenkins @ runtime.
    # Token is replacing Client Id and API Key.

    provider.token = ENV['DIGITAL_OCEAN_TOKEN']
    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']

    # - Switching to CentOS 7 from Ubuntu 14.04-1
    # - API_Key and Client_Id will give way to token. See Below.

    # San Francisco 1, 1CPU/512Mb/20GB, Centos 7 x86_64
    provider.region = 'sfo1'
    provider.size = '1gb'
    #provider.image = 'Ubuntu 14.04 x64'
    provider.image = "CentOS 7.0 x64"

  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.define "loganov-jenkins-pipeline_chef" do |node|
    node.vm.hostname = 'jenkins-test.loganov.com'

    node.vm.provision :chef_client do |chef|
      chef.chef_server_url = 'https://chef.loganov.com:443'
      chef.validation_key_path = '/etc/chef-client/validation.pem'
      chef.validation_client_name = 'chef-validator'
      chef.delete_node = true
      chef.delete_client = true
      chef.add_role('loganov-base')
      chef.add_recipe('loganov-jenkins::pipeline_chef')
    end

  end

end
