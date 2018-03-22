#!/bin/bash

set -e

test::check_syntax() {
  ansible-playbook bootstrap.yml -i 'localhost' --syntax-check
  }

  test::run_ansible() {
    ansible-playbook bootstrap.yml -i 'localhost'
}

test::check_syntax
test::run_ansible
