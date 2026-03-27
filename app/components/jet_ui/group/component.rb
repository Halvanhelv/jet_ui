# frozen_string_literal: true

module JetUi
  module Group
    class Component < BaseComponent
      def initialize(sticky: true, **options)
        @sticky = sticky
        @options = options
      end

      def call
        content_tag :div, content, class: classes, **@options
      end

      private

      def classes
        class_names(
          "ui_group",
          { "ui_group-sticky": @sticky },
          @options.delete(:class)
        )
      end
    end
  end
end
