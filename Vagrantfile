#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin('vagrant-sprinkle')

Vagrant.configure('2') do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.provision(:sprinkle) do |sprinkle|
    sprinkle.script = "sprinkle.rb"
  end
end
