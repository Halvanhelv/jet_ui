# frozen_string_literal: true

module JetUi
  module Badge
    class Component < BaseComponent
      VARIANTS = %i[default info error success warning].freeze
      DEFAULT_VARIANT = :default
      SIZES = %i[xs sm md lg].freeze
      DEFAULT_SIZE = :sm

      def initialize(variant: DEFAULT_VARIANT, size: DEFAULT_SIZE, rounded: false, **options)
        @variant = VARIANTS.include?(variant) ? variant : DEFAULT_VARIANT
        @size    = SIZES.include?(size) ? size : DEFAULT_SIZE
        @rounded = rounded
        @options = options
      end

      def call
        content_tag :span, content, class: classes, **@options
      end

      private

      def classes
        class_names(
          "badge",
          "badge-#{@variant}",
          "badge-#{@size}",
          { "badge-rounded": @rounded },
          @options.delete(:class)
        )
      end
    end
  end
end
