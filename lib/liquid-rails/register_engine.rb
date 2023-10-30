module Liquid
  module Rails
    module RegisterEngine
      class Transformer
        def self.call(input)
          context = input[:environment].context_class.new(input)
          Liquid::Template.new(input[:name]) { input[:data] }.render(context)
        end
      end

      class << self
        def register_engine(app, config)
          if ::Rails::VERSION::MAJOR == 3
            _register_engine3(app)
          else
            _register_engine(config)
          end
        end

        private

        def _register_engine3(app)
          return unless app.assets
          return unless app.assets.respond_to?(:register_engine)

          app.assets.register_engine(".liquid", Liquid::Template)
        end

        def _register_engine(config)
          return unless config.respond_to?(:assets)

          config.assets.configure do |env|
            if env.respond_to?(:register_transformer) && Sprockets::VERSION.to_i > 3
              env.register_mime_type "text/liquid", extensions: [".liquid", ".liquid.html"] # , charset: :html
              env.register_transformer "text/liquid", "text/html", RegisterEngine::Transformer
            elsif env.respond_to?(:register_engine)
              args = [".liquid", Liquid::Template]
              args << {silence_deprecation: true} if Sprockets::VERSION.start_with?("3")
              env.register_engine(*args)
            end
          end
        end
      end
    end
  end
end
