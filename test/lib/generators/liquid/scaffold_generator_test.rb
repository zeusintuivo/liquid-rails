require "test_helper"
require "lib/generators/liquid/testing_helper"

class Liquid::Generators::ScaffoldGeneratorTest < Rails::Generators::TestCase
  include LiquidLintHelpers

  destination File.join(Rails.root)
  tests Rails::Generators::ScaffoldGenerator
  arguments %w[product_line title:string price:integer --template-engine liquid --orm active-record]

  setup :prepare_destination
  setup :copy_routes

  test "should invoke template engine" do
    run_generator

    %w[index edit new show _form].each { |view| assert_file File.join "app", "views", "product_lines", "#{view}.html.liquid" }
    assert_no_file File.join "app", "views", "layouts", "product_lines.html.liquid"
  end

  test "should revoke template engine" do
    run_generator
    run_generator ["product_line", "--orm", "active-record"], behavior: :revoke

    assert_no_file File.join "app", "views", "product_lines"
    assert_no_file File.join "app", "views", "layouts", "product_lines.html.liquid"
  end

  test "should generate LiquidLint valid templates" do
    run_generator
    templates = Dir[File.join(Rails.root, "app", "views", "**", "*.liquid")]
    assert_empty lint(templates)
  end
end
