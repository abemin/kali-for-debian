#!/bin/bash

# check permissions
if [ "$USER" == "root" ]; then
  if [ "$1" == "install" ]; then
    # pre-requisites
    apt-get update
    apt-get install -y wget
    # repo and keys
    echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
    wget https://archive.kali.org/archive-key.asc
    apt-key add archive-key.asc
    apt-get update
    echo "SUCCESS: Kali Linux repository and GPG keys have been added."
    exit 0
  elif [ "$1" == "enable" ]; then
    # enable repo
    echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
    apt-get update
    echo "SUCCESS: Kali repository ENABLED."
    exit 0
  elif [ "$1" == "disable" ]; then
    # disable repo
    echo "#deb http://http.kali.org/kali kali-rolling main non-free contrib" > /etc/apt/sources.list.d/kali.list
    apt-get update
    echo -e "SUCCESS: Kali repository DISABLED."
    exit 0
  elif [ "$1" == "help" ]; then
    # help menu
    echo -e "\nUsage: $BASH_SOURCE [argument]\n\nArguments:\n\n\
      install       Adds the Kali Linux repository and installs GPG keys.\n\n\
      enable        Enables the Kali Linux repository.\n\n\
      disable       Disables the Kali Linux repository.\n\n" | sed -e "s|^[[:space:]]*||"
    exit 0
  else
    echo -e "ERROR: Invalid argument supplied.\nTry '$BASH_SOURCE help' for more information."
    exit 1
  fi
else
  echo -e "ERROR: Please run as root."
  exit 1
fi
