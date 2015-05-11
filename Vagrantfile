Vagrant.configure('2') do |config|
  config.vm.box      = 'trusty32'
  config.vm.box_url  = 'trusty-server-cloudimg-i386-vagrant-disk1.box'
  config.vm.hostname = 'devenv'

  config.vm.provider "virtualbox" do |v|
    v.memory = "1024"
  end

  config.vm.network "private_network", ip: "10.10.10.10"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4567, host: 4567
  config.vm.synced_folder ".", "/home/vagrant/code/devenv", type: "nfs"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
    puppet.options        = '--verbose --debug'
  end
  
end
