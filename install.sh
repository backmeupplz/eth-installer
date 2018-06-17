#!/bin/bash

# Install Node
case "$OSTYPE" in
  linux*)
    echo "OS detected: Linux / WSL, installing Node" 
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get install -y build-essential
    echo "Installing geth"
    sudo apt-get install software-properties-common
    sudo add-apt-repository -y ppa:ethereum/ethereum
    sudo apt-get update
    sudo apt-get install ethereum
    ;;
  darwin*)
    echo "OS detected: Mac OS, installing homebrew" 
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Installing node"
    brew install node
    echo "Installing geth"
    brew tap ethereum/ethereum
    brew install ethereum
    ;;
  *)
    echo "Unknown OS, aborting"
    exit 1
    ;;
esac

echo "Installing testrpc"
npm install -g ethereumjs-testrpc
echo "Installing truffle"
npm install -g truffle
