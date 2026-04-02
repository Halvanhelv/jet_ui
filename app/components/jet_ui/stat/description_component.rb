# frozen_string_literal: true

module JetUi
  module Stat
    class DescriptionComponent < BaseComponent
      VARIANTS = %i[default success warning error].freeze
      DEFAULT_VARIANT = :default

      TRENDING_UP_PATH   = 'M2.25 17.9999L9 11.2499L13.3064 15.5564C14.5101 13.188 16.5042 ' \
                           '11.2022 19.1203 10.0375L21.8609 8.81726M21.8609 8.81726L15.9196 ' \
                           '6.53662M21.8609 8.81726L19.5802 14.7585'
      TRENDING_DOWN_PATH = 'M2.25 6L9 12.75L13.2862 8.46383C15.3217 10.0166 16.8781 12.23 ' \
                           '17.5919 14.8941L18.3684 17.7919M18.3684 17.7919L21.5504 ' \
                           '12.2806M18.3684 17.7919L12.857 14.6099'

      def initialize(variant: DEFAULT_VARIANT, **options)
        @variant = VARIANTS.include?(variant) ? variant : DEFAULT_VARIANT
        @options = options
      end

      def call
        content_tag :p, class: classes, **@options do
          safe_join([trend_icon, content].compact)
        end
      end

      private

      def classes
        class_names(
          'stat__description',
          variant_class,
          @options.delete(:class)
        )
      end

      def variant_class
        return nil if @variant == :default

        "stat__description--#{@variant}"
      end

      def trend_icon
        return nil if @variant == :default

        path = @variant == :success ? TRENDING_UP_PATH : TRENDING_DOWN_PATH
        tag.svg(
          tag.path(d: path, stroke: 'currentColor', 'stroke-width': '1.5',
                   'stroke-linecap': 'round', 'stroke-linejoin': 'round'),
          width: '16', height: '16', viewBox: '0 0 24 24',
          fill: 'none', xmlns: 'http://www.w3.org/2000/svg',
          'aria-hidden': 'true'
        )
      end
    end
  end
end
