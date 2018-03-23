# Ansible Bootstrap

[![Build Status](https://travis-ci.org/k4ch0/ansible-ubuntu-bootstrap.svg?branch=master)](https://travis-ci.org/k4ch0/ansible-ubuntu-bootstrap)

This repository contains a minimal Ansible role used for bootstrapping an Ubuntu server.

The included tasks are:

* Copy configuration files
* Configure locale
* Install and update Ubuntu packages
* Create users, assigning groups and public keys
* Basic security configuration:
    - Disable SSH root access
    - Disable password authentication
    - Install [Fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page)
    - Configure [UFW Firewall](https://help.ubuntu.com/community/UFW)
* Configure [Mailgun](https://www.mailgun.com) as a SMTP relay
* Install and configure [NewRelic server monitoring](https://docs.newrelic.com/docs/server/installation-ubuntu-and-debian)

## Requirements

Ansible - 2.4 + above
Ubuntu - 16.04 + above
SSH Authentication for the root user.

## Configuration

Configure the following, on the file: roles/bootstrap/defaults/main.yml 

#
# MailGun Credentials
#
mailgun_username: user@example.com 
mailgun_password: password
#
# Who should receive root's email?
root_forward: user@example.com
#
users:
    - {name: 'USERNAME', public_key: 'SSH KEY for USERNAME', password: 'USERNAME PASSWORD' }

locale: en_US.UTF-8
language: 'en_US:en'
timezone: America/Chicago

newrelic_license_key: "NEW RELIC LICENSE"

ufw_ports:
  - "ssh"
  - "http"
  - "https"

## Usage

Check the connection from Ansible to the server. From the project root you can ping to the server

    ansible SERVER -m ping
  
Finally, the role can be executed using

    ansible-playbook bootstrap.yml

If you don't need any of the tasks, just comment them in the _main.yml_ file of the role.  
