# frozen_string_literal: true

module JetUi
  module Alert
    class TitleComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :strong, content, class: classes, **@options
      end

      private

      def classes
        class_names('alert__title', @options.delete(:class))
      end
    end
  end
end
