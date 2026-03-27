# frozen_string_literal: true

module JetUi
  module Alert
    class IconComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :span, content, class: classes, **@options
      end

      private

      def classes
        class_names("alert__icon", @options.delete(:class))
      end
    end
  end
end
