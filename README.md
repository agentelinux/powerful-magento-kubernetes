powerful-magento-kubernetes
======================

A VERY simple (and powerful) Magento environment provisioner for [Docker](http://www.docker.com/).

[Magento & kubernetes]

* Creates a running Magento environment with a few simple commands.
* Runs on Ubuntu (Trusty 14.04 64 Bit) \w
  * Percona Server 5.6 (like MySQL) as Service (HA)
  * ProxySQL
  * Redis  (Session and Page Cache)
  * HHVM 3 (PHP from Facebook)
  * Nginx 1.4 (HTTP server)
* Uses [Magento CE 2.*](http://www.magentocommerce.com/download)
* Automatically runs Magento's installer and creates CMS admin account.
* Optionally installs Magento Sample Store Inventory
* Goes from naught-to-Magento in a couple of minutes.
* Removed packages: apache2* and php5*

## Getting Started

**Prerequisites**

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Docker](http://www.docker.com/)
* Clone or [download](https://github.com/agentelinux/powerful-magento-vagrant/archive/master.zip) this repository to the root of your project directory `git clone https://github.com/agentelinux/powerful-magento-vagrant.git`
* Create cluster Kubernetes in GCP Google Container Engine

## Usage

* In your browser, head to `127.0.0.1:8081`
* Magento CMS is accessed at `127.0.0.1:8081/admin`
* User: `admin` Password: `password123123`


## Sample Data

## Todo
* Install Magento
* Install Percona as Service
* Install Redis as Service
* Install Kubernetes
