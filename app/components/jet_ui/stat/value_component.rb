# frozen_string_literal: true

module JetUi
  module Stat
    class ValueComponent < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :p, content, class: classes, **@options
      end

      private

      def classes
        class_names("stat__value", @options.delete(:class))
      end
    end
  end
end
