# ODOO 8 DEVELOPMENT ENVIRONMENT

Quick bootstrap to start developing in odoo 8.

[![Travis-CI](https://img.shields.io/travis/vonpupp/odoo-devenv8.svg)](https://travis-ci.org/vonpupp/odoo-devenv8)
[![Coveralls Status](https://coveralls.io/repos/vonpupp/odoo-devenv8/badge.svg)](https://coveralls.io/r/vonpupp/odoo-devenv8)
[![Scrutinizer](https://img.shields.io/scrutinizer/g/vonpupp/odoo-devenv8.svg)](https://scrutinizer-ci.com/g/vonpupp/odoo-devenv8/)
[![Stories in Ready](https://badge.waffle.io/vonpupp/odoo-devenv8.png?label=ready&title=Ready)](http://waffle.io/vonpupp/odoo-devenv8)
[![Stories in progress](https://badge.waffle.io/vonpupp/odoo-devenv8.png?label=progress&title=Progress)](http://waffle.io/vonpupp/odoo-devenv8)

Throughput Graph

[![Throughput
Graph](https://graphs.waffle.io/vonpupp/odoo-devenv8/throughput.svg)](https://waffle.io/vonpupp/odoo-devenv8/metrics)


## Creating a development environment using virtualbox

```sh
# Start the VM
vagrant up

# ssh to the VM
vagrant ssh

# Bootstrap packages
cd /vagrant
./provision/bootstrap-packages-debian-jessie64.sh

# Bootstrap database
./provision/bootstrap-database.sh

# Create a virtualenv locally
./provision/bootstrap-environment.sh

# Start odoo
bin/start_odoo

# Open the browser
firefox 192.168.33.10:8069
```

## Creating a module skeleton using mrbob odoo templates

```sh
# Create a virtual env
virtualenv2 .venv
source .venv/bin/activate

# Install bob templates
(.venv) > $ pip2 install bobtemplates.odoo

# Create a basic addon manifest
(.venv) > $ mrbob bobtemplates.odoo:addon

--> Addon name (with underscores): todo_kanban
--> Is it an OCA addon [n]: n
--> Summary: Kanban board for to-do tasks.
--> Version [10.0.1.0.0]: 8
--> Copyright holder name: vonpupp
--> Copyright year: 2017
--> Website:

# Restart the server
> $ bin/start_odoo

# Update the apps via the web interface
# Install the new app


# Create a model skeleton for the app
(.venv) > $ cd todo_kanban
(.venv) todo_kanban > $ mrbob bobtemplates.odoo:model

--> Odoo version (8|9|10) [10]: 8
--> Model name (dotted notation): todo.task
--> Inherit [y]: y
--> Form view [y]: y
--> Search view [y]: y
--> Tree view [y]: y
--> Action and menu entry [y]: y
--> ACL [y]: y
--> Demo data [y]: y
--> Copyright holder name: vonpupp
--> Copyright year: 2017


# Create tests skeleton for the app
(.venv) todo_kanban > $ mrbob bobtemplates.odoo:test

--> Odoo version (8|9|10) [10]: 8
--> Test file name (with underscores): test_kanban
--> Copyright holder name: vonpupp
--> Copyright year: 2017

```

## Updating the module

```sh
# Update a specific module
bin/start_odoo -d vagrant -u todo_kanban --stop-after-init

# Unit test a specific app using
bin/start_odoo -d vagrant -i todo_kanban --test-enable
```


## Roadmap

- [X] Skeleton using bob templates
- [ ] Maintainer quality tools
- [ ] Coverage
- [ ] Code quality
- [ ] Documentation (sphinx)
- [ ] UML
- [ ] odoo-bin
- [ ] Watchdog
- [ ] Deploy
- [ ] robotframework
- [ ] openupgrade (OCA)
- [ ] Runbot
