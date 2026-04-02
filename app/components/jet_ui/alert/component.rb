# frozen_string_literal: true

module JetUi
  module Alert
    class Component < BaseComponent
      VARIANTS = %i[default info error success warning].freeze
      DEFAULT_VARIANT = :default

      def initialize(variant: DEFAULT_VARIANT, **options)
        @variant = VARIANTS.include?(variant) ? variant : DEFAULT_VARIANT
        @options = options
      end

      def call
        content_tag :div, content, class: classes, **@options
      end

      private

      def classes
        class_names(
          'alert',
          "alert-#{@variant}",
          @options.delete(:class)
        )
      end
    end
  end
end
