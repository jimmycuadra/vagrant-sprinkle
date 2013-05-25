begin
  require 'vagrant'
rescue LoadError
  raise 'vagrant-sprinkle must be loaded within Vagrant.'
end


module VagrantPlugins
  module Sprinkle
    class Plugin < Vagrant.plugin('2')
      name 'sprinkle'
      description 'Adds a Sprinkle provisioner to Vagrant.'

      config(:sprinkle) do
        require_relative 'config'
        Config
      end

      provisioner(:sprinkle) do
        require_relative 'provisioner'
        Provisioner
      end
    end
  end
end
