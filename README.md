# vagrantxdocker
This project contains:
- a Vagrantfile that creates a Ubuntu-based Docker image 
- an Apache default file containing reverse proxy configuration (referenced in the Vagrant file)
- a Dockerfile containing installation & deployment of a Java application with Apache in front of it

Prerequisites:
1. Install Vagrant
2. Install VirtualBox

Installation:
1. Create a Vagrant project (i.e. with "vagrant init ubuntu/trusty64")
2. Copy the Vagrantfile provided in this git repo into your project
3. Copy the Dockerfile provided in this git repo into your project
4. Start it up via "vagrant up"
