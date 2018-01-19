Vagrant.configure("2") do |config|
  #Use CentOS 7
  config.vm.box = "centos/7"

  # Forward guest SSL port to host's external address and port
  # Networking configuration may be vagrant provider specific
  #https
  config.vm.network "forwarded_port", guest: 443, host: 8443, host_ip: "0.0.0.0"
  #http required only for LetsEncrypt challenge
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "0.0.0.0"

  #configure VM
  config.vm.provider "libvirt" do |domain|
      domain.memory = 2048
      domain.cpus = 2
  end

  # Run Ansible from the Vagrant Host
  config.vm.provision "ansible" do |ansible|
	ansible.playbook = "provision.yml"
  end

end
