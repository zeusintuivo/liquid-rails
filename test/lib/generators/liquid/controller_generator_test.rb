require "test_helper"
require "lib/generators/liquid/testing_helper"

class Liquid::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
  include LiquidLintHelpers

  destination File.join(Rails.root)
  tests Rails::Generators::ControllerGenerator
  arguments %w[Account foo bar --template-engine liquid]

  setup :prepare_destination
  setup :copy_routes

  test "should invoke template engine" do
    run_generator
    assert_file File.join("app", "views", "account", "foo.html.liquid"), %r{app/views/account/foo\.html\.liquid}
    assert_file File.join("app", "views", "account", "bar.html.liquid"), %r{app/views/account/bar\.html\.liquid}
  end

  test "should generate LiquidLint valid templates" do
    run_generator
    templates = Dir[File.join(Rails.root, "app", "views", "**", "*.liquid")]
    assert_empty lint(templates)
  end
end
