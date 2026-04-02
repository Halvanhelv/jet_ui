# frozen_string_literal: true

module JetUi
  module Btn
    class Component < BaseComponent
      SIZES = %i[xs sm md lg icon_xs icon_sm icon_md icon_lg].freeze
      DEFAULT_SIZE = :md

      VARIANTS = %i[default outline secondary danger ghost link].freeze
      DEFAULT_VARIANT = :default

      def initialize(variant: DEFAULT_VARIANT, url: nil, size: DEFAULT_SIZE, rounded: false, block: false,
                     circle: false, method: nil, **options)
        @variant = VARIANTS.include?(variant) ? variant : DEFAULT_VARIANT
        @url = url
        @size = SIZES.include?(size.to_sym) ? size.to_sym : DEFAULT_SIZE
        @rounded = rounded
        @block = block
        @circle = circle
        @method = method
        @options = options
      end

      def call
        if @url && @method
          button_to @url, class: classes, method: @method, **@options do
            content
          end
        elsif @url
          link_to content, @url, class: classes, **@options
        else
          button_tag content, type: 'button', class: classes, **@options
        end
      end

      private

      def classes
        class_names(
          'btn',
          "btn-#{@variant}",
          "btn-#{@size.to_s.tr('_', '-')}",
          { 'btn-block': @block },
          { 'btn-rounded': @rounded },
          { 'btn-circle': @circle },
          @options.delete(:class)
        )
      end
    end
  end
end
