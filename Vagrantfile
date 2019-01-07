Vagrant.configure('2') do |config|

  config.vm.hostname = 'localhost'
  config.vm.box = 'ubuntu/trusty64'
  config.vm.box_check_update = false

  config.vm.synced_folder './', '/vagrant'

  config.vm.define 'docker' do |docker|
    docker.vm.network :forwarded_port, guest: 8080, host: 8080
    docker.vm.network :forwarded_port, guest: 80, host: 8080

    docker.vm.provider :virtualbox do |vb|
      vb.name = 'dropwizard-docker'
      vb.customize ['modifyvm', :id, '--memory', '1024', '--cpus', '2']
    end

    docker.vm.provision :shell do |shell|
      shell.inline = <<-SHELL
	sudo curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
      SHELL
    end
    
    docker.vm.provision :docker do |docker|
      docker.build_image '/vagrant/.', args: '-t dropwizard-jar'
      docker.run 'dropwizard-jar', args: '-it -p 8080:8080 -p 80:80'
    end
  end
  
end