require 'rails/generators'

module Redactor2
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      desc 'Generates redactor2_rails config'

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end


      def create_config
        template 'config.js', File.join('app/assets/javascripts/redactor2_rails', 'config.js')
      end
    end
  end
end
