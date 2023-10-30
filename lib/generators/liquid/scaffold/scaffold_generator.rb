require "rails/generators/erb/scaffold/scaffold_generator"

module Liquid
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator # :nodoc:
      if ::Rails::VERSION::MAJOR >= 7
        source_root File.expand_path(File.join("..", "templates"), __FILE__)
      else
        source_root File.expand_path(File.join("..", "legacy_templates"), __FILE__)
      end

      def copy_view_files
        available_views.each do |view|
          filename = filename_with_extensions view
          template "#{view}.html.liquid", File.join("app", "views", controller_file_path, filename)
        end

        if ::Rails::VERSION::MAJOR >= 7
          template "partial.html.liquid", File.join("app/views", controller_file_path, "_#{singular_name}.html.liquid")
        end
      end

      hook_for :form_builder, as: :scaffold

      protected

      def available_views
        %w[index edit show new _form]
      end

      def handler
        :liquid
      end
    end
  end
end
