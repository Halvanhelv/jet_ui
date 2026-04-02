# frozen_string_literal: true

module JetUi
  module Card
    class SubtitleComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag(:span, content, class: classes, **@options)
      end

      private

      def classes
        class_names(
          'card__subtitle',
          @options.delete(:class)
        )
      end
    end
  end
end
