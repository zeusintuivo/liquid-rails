require "rails/generators/erb/mailer/mailer_generator"

module Liquid
  module Generators
    class MailerGenerator < Erb::Generators::MailerGenerator
      source_root File.expand_path(File.join("..", "templates"), __FILE__)

      protected

      def format
        :text
      end

      def formats
        [:text, :html]
      end

      def handler
        :liquid
      end
    end
  end
end
