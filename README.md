powerful-magento-docker
======================

A VERY simple (and powerful) Magento environment provisioner for [Docker](http://www.docker.com/).

![Magento & Docker]

* Creates a running Magento development environment with a few simple commands.
* Runs on Ubuntu (Trusty 14.04 64 Bit) \w
  * Percona Server 5.6 (like MySQL)
  * Redis  (Session and Page Cache)
  * HHVM 3 (PHP from Facebook)
  * Nginx 1.4 (HTTP server)
  * Varnish 3 (Reverse Proxy and Cache Content)
* Uses [Magento CE 1.9.1.1](http://www.magentocommerce.com/download)
* Automatically runs Magento's installer and creates CMS admin account.
* Optionally installs Magento Sample Store Inventory
* Automatically runs [n98-magerun](https://github.com/netz98/n98-magerun) installer.
* Perfect for rapid development or extension testing with an unopionionated, bare-bones and easily tweaked configuration.
* Goes from naught-to-Magento in a couple of minutes.
* Removed packages: apache2* and php5*
* Thanks [r-baker](https://github.com/r-baker/simple-magento-vagrant)

## Getting Started

**Prerequisites**

* Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install [Docker](http://www.docker.com/)
* Clone or [download](https://github.com/agentelinux/powerful-magento-vagrant/archive/master.zip) this repository to the root of your project directory `git clone https://github.com/agentelinux/powerful-magento-vagrant.git`
* In your project directory, run `vagrant up`

The first time you run this, Vagrant will download the bare Ubuntu box image. This can take a little while as the image is a few-hundred Mb. This is only performed once.

Vagrant will configure the base system before downloading Magento and running the installer.

## Usage

* In your browser, head to `127.0.0.1:8081`
* Magento CMS is accessed at `127.0.0.1:8081/admin`
* User: `admin` Password: `password123123`
* Access the virtual machine directly using `vagrant ssh`
* When you're done `vagrant halt`

[Full Vagrant command documentation](http://docs.vagrantup.com/v2/cli/index.html)

## Sample Data

Sample data is automatically downloaded and installed by default. However, it's a reasonably large file and can take a while to download.

> "I don't want sample data"

Sample data installation can be disabled:

 * Open `Vagrantfile`
 * Change `sample_data = "true"` to `sample_data = "false"`
 * Run `vagrant up` as normal

> "I have already downloaded the sample data"

 * Place the sample data `tar.gz` file in the project root
 * Ensure `sample_data = "true"`
 * The provisioning script will skip the download and use the provided file instead. The same goes for when the provisioner is rerun. e.g. `vagrant reload --provision`

## Todo
* Install Modman.

**Why no Puppet/Chef?**
Admittedly, Puppet and Chef are excellent solutions for predictable and documented system configurations. The emphasis for this provisioner is on unopinionated simplicity. There are some excellent Puppet / Chef Magento configurations on Github with far more bells and whistles.
