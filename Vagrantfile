# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "ubuntu"
    config.vm.hostname = "server-dev"
    config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "private_network", ip: "192.168.33.10"

<<<<<<< HEAD
    #config.vm.box_check_update = false
    #config.vm.network "public_network"
    #config.ssh.forward_agent = true 
    
    config.vm.synced_folder "/vagrant", "/vagrant", :nfs => true, :mount_options => ['rw', 'vers=3', 'tcp']
    
    if Vagrant.has_plugin?("vagrant-cachier")
        config.cache.scope = :box
     
        #config.cache.synced_folder_opts = {
        #  type: :nfs,
        #  mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
        #}
    end
    
    #config.vm.synced_folder "~/www", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]    
=======
    # config.vm.box_check_update = false
    # config.vm.network "public_network"
    # config.ssh.forward_agent = true 
    #config.vm.synced_folder "~/www", "/vagrant", :nfs => true, :mount_options => ['rw', 'vers=3', 'tcp']
    #if Vagrant.has_plugin?("vagrant-cachier")
    #    config.cache.scope = :box
    #
    #    config.cache.synced_folder_opts = {
    #      type: :nfs,
    #      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    #    }
    #end
    
    config.vm.synced_folder "~/www", "/vagrant", :mount_options => ["dmode=777", "fmode=666"]    
>>>>>>> 0ae8fdd5e8876d50f0f2f04ce22f0aa3ba0772e4
    
    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end


    config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "site.pp"
        puppet.module_path = "modules"

        puppet.facter = {
            'fqdn'    => 'server-dev',
            'db_use'  => 'root',
            'db_pass' => '',
            'db_host' => 'localhost',
        }
    end
end
