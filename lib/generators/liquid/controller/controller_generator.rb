require "rails/generators/erb/controller/controller_generator"

module Liquid
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      source_root File.expand_path(File.join("..", "templates"), __FILE__)

      protected

      def handler
        :liquid
      end
    end
  end
end
