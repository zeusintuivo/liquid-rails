require "liquid_lint"

module LiquidLintHelpers
  EXCLUDED_LINTERS = %w[LineLength]

  def lint(templates)
    LiquidLint::Runner.new.run(files: templates, excluded_linters: EXCLUDED_LINTERS).lints.map(&:message)
  end
end

require_generators liquid: ["scaffold", "controller", "mailer"]
