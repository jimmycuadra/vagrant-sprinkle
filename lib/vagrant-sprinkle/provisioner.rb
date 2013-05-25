module VagrantPlugins
  module Sprinkle
    class Provisioner < Vagrant.plugin('2', :provisioner)
      def provision
        command = ['sprinkle'].concat(compile_options)

        Vagrant::Util::Subprocess.execute(*command) do |type, data|
          if type == :stdout || type == :stderr
            machine.env.ui.info(data.chomp, :prefix => false)
          end
        end
      end

      private

      def compile_options
        options = []
        options << "--script=#{config.script}"
        options << "--only #{config.only}" if config.only
        options << '--test' if config.test
        options << '--verbose' if config.verbose
        options << '--cloud' if config.cloud
        options << '--force' if config.force
        options
      end
    end
  end
end
