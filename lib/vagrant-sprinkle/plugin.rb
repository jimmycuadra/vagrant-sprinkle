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

      config(:sprinkle, :provisioner) do
        require_relative 'config'
        Config
      end

      provisioner(:sprinkle) do
        I18n.load_path << File.expand_path(
          'locales/en.yml',
          Sprinkle.source_root
        )
        I18n.reload!

        require_relative 'provisioner'
        Provisioner
      end
    end
  end
end
