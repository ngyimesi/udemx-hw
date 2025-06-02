Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian11"
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 8192
    libvirt.cpus = 4
    libvirt.disk_bus = "sata"
  end
config.vm.define :UdemX_HW_automated do |foo|
#
end
config.vm.hostname = "UdemX-HW-automated"
  # Resize disk and change SSH port (pre-Ansible)
  config.vm.provision "shell", inline: <<-SHELL
    set -eux
    sed -i 's/^#Port 22/Port 10022/' /etc/ssh/sshd_config
    sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    systemctl restart sshd
  SHELL
  #config.ssh.port = 10022

  # Host-based Ansible provisioning
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.compatibility_mode = "2.0"
    ansible.limit = "all"
    ansible.host_vars = {
       "UdemX_HW_automated" => {
          "ansible_port" => 10022
        }
     } 
  end
end

