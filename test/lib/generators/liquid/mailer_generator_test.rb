require "test_helper"
require "lib/generators/liquid/testing_helper"

class Liquid::Generators::MailerGeneratorTest < Rails::Generators::TestCase
  include LiquidLintHelpers

  destination File.join(Rails.root)
  tests Rails::Generators::MailerGenerator
  arguments %w[notifier foo bar --template-engine liquid]

  setup :prepare_destination
  setup :copy_routes

  test "should invoke template engine" do
    run_generator

    rails_version = ::Rails.version.to_s

    if rails_version >= "5.0"
      assert_file "app/views/notifier_mailer/foo.html.liquid" do |view|
        assert_match %r{app/views/notifier_mailer/foo\.html\.liquid}, view
        assert_match(/\#\{@greeting/, view)
      end

      assert_file "app/views/notifier_mailer/bar.html.liquid" do |view|
        assert_match %r{app/views/notifier_mailer/bar\.html\.liquid}, view
        assert_match(/\#\{@greeting/, view)
      end

      assert_file "app/views/notifier_mailer/foo.text.liquid" do |view|
        assert_match %r{app/views/notifier_mailer/foo\.text\.liquid}, view
        assert_match(/@greeting/, view)
      end

      assert_file "app/views/notifier_mailer/bar.text.liquid" do |view|
        assert_match %r{app/views/notifier_mailer/bar\.text\.liquid}, view
        assert_match(/@greeting/, view)
      end
    else
      if rails_version >= "4.2"
        assert_file "app/views/layouts/mailer.text.liquid" do |view|
          assert_match(/= yield/, view)
        end

        assert_file "app/views/layouts/mailer.html.liquid" do |view|
          assert_match(/= yield/, view)
        end

        assert_file "app/views/notifier/foo.html.liquid" do |view|
          assert_match %r{app/views/notifier/foo\.html\.liquid}, view
          assert_match(/\#\{@greeting/, view)
        end

        assert_file "app/views/notifier/bar.html.liquid" do |view|
          assert_match %r{app/views/notifier/bar\.html\.liquid}, view
          assert_match(/\#\{@greeting/, view)
        end

      end

      assert_file "app/views/notifier/foo.text.liquid" do |view|
        assert_match %r{app/views/notifier/foo\.text\.liquid}, view
        assert_match(/@greeting/, view)
      end

      assert_file "app/views/notifier/bar.text.liquid" do |view|
        assert_match %r{app/views/notifier/bar\.text\.liquid}, view
        assert_match(/@greeting/, view)
      end
    end
  end

  test "should generate LiquidLint valid templates" do
    run_generator
    templates = Dir[File.join(Rails.root, "app", "views", "**", "*.liquid")]
    assert_empty lint(templates)
  end
end
