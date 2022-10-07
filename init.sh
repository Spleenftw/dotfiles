#! /bin/bash 

installAnsible () {
  apt install curl gnupg ansible -y

  # launch playbook
  ansible-galaxy collection install community.general
  ansible-playbook playbook.yaml --ask-become-pass -vvv
}

installAnsible
