lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "liquid-rails/version"

Gem::Specification.new do |spec|
  spec.name = "liquid-rails"
  spec.version = Liquid::Rails::VERSION
  spec.authors = ["zeusintuivo"]
  spec.email = ["zeus@intuivo.com"]

  spec.summary = "Liquid templates generator for Rails"
  spec.description = "Provides the generator settings required for Rails to use Liquid"
  spec.homepage = "https://github.com/zeusintuivo/liquid-rails"
  spec.license = "MIT"

  spec.files = Dir["{lib}/**/*", "README.md", "CHANGELOG.md", "LICENSE"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"
  spec.required_rubygems_version = ">= 1.3.7"
  
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_runtime_dependency "actionpack", [">= 3.1"]
  spec.add_runtime_dependency "railties", [">= 3.1"]
  spec.add_runtime_dependency "psych", [">= 3.0"]
  spec.add_runtime_dependency "liquid", [">= 3.0", "!= 5.0.0", "< 6.0"]

  spec.add_development_dependency "sprockets-rails"
  spec.add_development_dependency "rocco"
  spec.add_development_dependency "psych", [">= 3.0"]
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "actionmailer", [">= 3.1"]
  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "standardrb"
end

