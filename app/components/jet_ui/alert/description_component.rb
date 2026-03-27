# frozen_string_literal: true

module JetUi
  module Alert
    class DescriptionComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :div, content, class: classes, **@options
      end

      private

      def classes
        class_names("alert__description", @options.delete(:class))
      end
    end
  end
end
