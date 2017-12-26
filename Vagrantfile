# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.username = "vagrant"
  config.ssh.forward_agent = true
  config.vm.provision :shell, :path => "vagrant_setup.sh", :privileged => false

  name = "hardware"
  memory = "2048"

  config.vm.define "hardware", primary: true do |u64|
    u64.vm.network "private_network", ip: "10.10.10.10"
    u64.vm.provider "virtualbox" do |vb, override|
      override.vm.box ="geerlingguy/ubuntu1604"
      # Sync a folder between the host and all guests.
      # Uncomment this line (and adjust as you like)
      override.vm.synced_folder "./shared", "/shared"

      # Uncomment to enable USB passthrough. Run `vboxmanage list usbhost` and modify VendorID and ProductID accordingly
     # vb.customize ["modifyvm", :id, "--usb", "on"]
     # vb.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'pirate', '--vendorid', '0x0403', '--productid', '0x6001']
      vb.name = name
      vb.memory = memory
      vb.gui = false
    end
  end
end
