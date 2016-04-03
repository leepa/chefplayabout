# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.berkshelf.enabled = true

  boxes = {
    :worker => {
      :count    => 2, # You can set this to however many workers you want
      :start_ip => '192.168.133.100'
    },
    :balancer => {
      :ip   => '192.168.133.5',
      :pass => 'worker'
    }
  }

  # We'll store details of workers here
  $created_vms = {}

  def make_vm(config, hostname, ip, role, pass = nil)
    $created_vms[role] ||= []
    $created_vms[role] << ip

    config.vm.define hostname do |vm|
      vm.vm.hostname = "#{hostname}.local"
      vm.vm.network "private_network", ip: ip

      vm.vm.provision :chef_solo do |chef|
        chef.roles_path = 'roles'
        chef.add_role role
        if pass
          chef.json = {
            "custom_stuff" => {
              "ip_addresses" => pass
            }
          }
        end
      end
    end
  end

  boxes.each do |k, v|
    if v.has_key?(:count)
      last_octet = v[:start_ip].split('.')[3].to_i
      first_octets = v[:start_ip].gsub(/#{last_octet}$/, '')

      (1..v[:count]).each do |i|
        ip = "#{first_octets}#{i + last_octet}"
        hostname = "#{k}-#{i}"
        make_vm(config, hostname, ip, k)
      end
    else
      pass = nil
      if v.has_key?(:pass)
        pass = $created_vms[pass]
      end
      # No count, just a single VM
      make_vm(config, k, v[:ip], k, pass)
    end
  end
end
