vagrant-drupal-mysql-mmm
==========================
Vagrant Drupal 7 + mysql master-master replication setup (3 nodes). This mainly is to verify "[MySQL multi-master replication and Drupal breaking it](https://www.drupal.org/node/146921)" issue fixed and for other experiment purpose.

Environment
===========
This mainly target CentOS 6.5 x64 with VirtualBox and Vagrant pre-installed:

1. [Install Vagrant](http://www.vagrantup.com/downloads.html)
1. [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Steps
=====
After installed, call

    $ vagrant up

to launch 3 nodes:

1. m1 => 192.168.30.101 => mysql master node
1. m2 => 192.168.30.102 => mysql master node
1. m3 => 192.168.30.100 => Drupal 7 node

SSH into node m3:

    $ vagrant ssh m3

Run:

    $ /vagrant/init_drupal.sh

Then access http://localhost:8080/drupal to start Drupal installation. Information you need:

DB user     => druser
DB password => druser
DB name     => drupal
DB host     => 192.168.30.101 (or 192.168.30.102; pick one you prefer)

Note
====
Due to having troublesome on handling firewall, all 3 nodes iptables service got turned off.

Reference
=========
1. [How To Install Drupal on a Virtual Server Running CentOS 6](https://www.digitalocean.com/community/tutorials/how-to-install-drupal-on-a-virtual-server-running-centos-6--2)
1. [Mysql Master-Slave setup with Puppet and Vagrant](https://github.com/beltrachi/vagrant-puppet-mysql-master-slave)
1. [MySQL 5.1.71 資料庫同步(Replication)-雙機互備模式(CentOS 6.5 x86_64)](http://shaurong.blogspot.hk/2014/01/mysql-5171-replication-centos-65-x8664_29.html)