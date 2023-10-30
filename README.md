# liquid-rails [![Gem Version](https://img.shields.io/gem/v/liquid-rails.svg)](http://rubygems.org/gems/liquid-rails) [![Build Status](https://github.com/zeusintuivo/liquid-rails/actions/workflows/main.yml/badge.svg)](https://github.com/zeusintuivo/liquid-rails/actions/workflows/main.yml) [![Code Climate](https://codeclimate.com/github/zeusintuivo/liquid-rails/badges/gpa.svg)](https://codeclimate.com/github/zeusintuivo/liquid-rails)

liquid-rails provides Liquid generators for Rails:

* Any time you generate a controller or scaffold, you'll get Liquid templates
  (instead of ERB)
* When your Rails application loads, Liquid will be loaded and initialized
  automatically
* Liquid templates will be respected by the view template cache digestor

To use it, add this line to your Gemfile:

```ruby
gem "liquid-rails", '~> 1.0.0', github: 'zeusintuivo/liquid-rails'
```

And that's it.

Every time you generate a controller or scaffold, you'll get Liquid templates.

This gem is [tested with Ruby on Rails 5.2+](/.github/workflows/main.yml).

## History

`liquid-rails` was based on [haml-rails](https://github.com/haml/haml-rails) and it does basically the same thing.

From the version 1.0.0, there is no need to include gem "liquid" in your Gemfile.
