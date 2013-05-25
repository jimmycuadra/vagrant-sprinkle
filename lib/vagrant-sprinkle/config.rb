module VagrantPlugins
  module Sprinkle
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :script
      attr_accessor :only
      attr_accessor :test
      attr_accessor :verbose
      attr_accessor :cloud
      attr_accessor :force

      def initialize
        self.script   = UNSET_VALUE
        self.only     = UNSET_VALUE
        self.test     = UNSET_VALUE
        self.verbose  = UNSET_VALUE
        self.cloud    = UNSET_VALUE
        self.force    = UNSET_VALUE
      end

      def finalize!
        self.script   = nil if script == UNSET_VALUE
        self.only     = nil if only == UNSET_VALUE
        self.test     = nil if test == UNSET_VALUE
        self.verbose  = nil if verbose == UNSET_VALUE
        self.cloud    = nil if cloud == UNSET_VALUE
        self.force    = nil if force == UNSET_VALUE
      end

      def validate(machine)
        errors = []

        if script
          unless Pathname.new(script).expand_path(machine.env.root_path).file?
            errors << I18n.t(
              'vagrant.provisioners.sprinkle.script_path_invalid',
              :path => expanded_path
            )
          end
        else
          errors << I18n.t('vagrant.provisioners.sprinkle.no_script')
        end

        { 'Sprinkle provisioner' => errors }
      end
    end
  end
end
