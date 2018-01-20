# vagrantp
#### Assignment

Create a repository on BitBucket or GitHub with the following:

  - A Vagrantfile for managing a VM with a Linux-based OS of your choice. Use a publicly available box.
  - A provisioner (Ansible, Chef, Puppet, Salt) to manage the configuration of the services in the Vagrantfile.
  - Provisioned services:
    - HAProxy
        - Configure SSL termination on frontend
        - Create a self-signed certificate or use LetsEncrypt, also document the commands you are using to create the certificate
        - Use TLS only
        - Use strong ciphers only
        - Generate a DH key and enable dhparam, also document the commands you are using to create a dh key
        - Enable HSTS
        - Enable OCSP Stapling
        - Send traffic to nginx SSL backend
    - nginx
        - Enable HTTPS
        - Enable Nginx Microcaching and make sure Cache is not enabled in Admin Area and for logged in users
        - Add any other configuration you may think is important (headers, deny access to important files and folders, ...)
    - php-fpm
        - For process management: choose either static, on demand, dynamic, also explain your decision
        - Listen directive: choose either Socket or TCP, also explain your decision
        - Add any other configuration you may think is important (number of workers, timeout, …)
    - Redis
        - Create a Timer Unit File to execute a self written script by yourself (bash, python, ..) every 5 minutes to load some dummy data into Redis (can be simple key/value i.e. hello/world)
    - MySQL
  - Create a simple website to serve with php-fpm that displays the string 'Hello World'
  - Write your explanations and documentations into the Readme

#### Solution

Before using this solution, you should have vagrant with a working provider installed. Visit [Getting Started](https://www.vagrantup.com/intro/getting-started/index.html) in Vagrant documentation for more info. A working Internet connection is also required.

This solution was developed on bare metal host using Fedora 26 Workstation with qemu-kvm and libvirt.
Ansible provisioner is written for CentOS 7 with packages from Base and EPEL repositories. Provisioner is based on [Ansible best practices repository](https://github.com/ansible/ansible-examples).

Edit group_vars/all file to suit your needs before provisioning the box.

Usage:
```shell
$ vagrant init cnetos/7
$ vagrant up
```

Additional comments
- HAProxy
- nginx
- php-fpm
- Redis  
  Redis is installed with default configuration. Timer job is written purely in bash due to ambiguity of the assignment. And just for kicks.
- MySQL  
  No databases or users are created. Only minimal security setup equivalent to running mysql_secure_installation. Root password is set from variable defined in group_vars. MariaDB is replacement for Oracle's MySQL on RHEL/CentOS.
