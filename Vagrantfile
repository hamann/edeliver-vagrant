# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'debian/jessie64'
  config.vm.hostname = "edeliver-vagrant"

   config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = 2
   end

   config.vm.network :forwarded_port, guest: 4000, host: 4000

   config.ssh.forward_agent = true

   config.vm.provision 'shell', path: 'bootstrap/base.sh', privileged: false
   config.vm.provision 'shell', path: 'bootstrap/postgresql.sh', privileged: false
   config.vm.provision 'shell', path: 'bootstrap/elixir.sh', privileged: false
   config.vm.provision 'shell', path: 'bootstrap/nodejs.sh', privileged: false
end
