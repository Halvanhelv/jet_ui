# frozen_string_literal: true

module JetUi
  module Stat
    class LabelComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :p, content, class: classes, **@options
      end

      private

      def classes
        class_names('stat__label', @options.delete(:class))
      end
    end
  end
end
