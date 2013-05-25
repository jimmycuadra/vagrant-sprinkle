module VagrantPlugins
  module Sprinkle
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../..', __FILE__))
    end
  end
end

require 'vagrant-sprinkle/version'
require 'vagrant-sprinkle/plugin'
