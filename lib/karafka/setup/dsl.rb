# frozen_string_literal: true

module Karafka
  module Setup
    # Dsl for allowing to work with the configuration from the Karafka::App
    # @note Despite providing methods, everything is still persisted and fetched
    # from the Karafka::Setup::Config
    module Dsl
      # Sets up the whole configuration
      # @param [Block] block configuration block
      def setup(&block)
        Setup::Config.setup(&block)
        initialize!
      end

      # Allows us to configure a block, that will be executed after everything is loaded
      # and configured but before the code runs
      # @param [Block] block that should be executed after the initialization process
      def after_init(&block)
        config.internal.after_init = block
      end

      # @return [Karafka::Config] config instance
      def config
        Setup::Config.config
      end
    end
  end
end
