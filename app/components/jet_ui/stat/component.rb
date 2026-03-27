# frozen_string_literal: true

module JetUi
  module Stat
    class Component < BaseComponent
      def initialize(**options)
        @options = options
      end

      def call
        content_tag :div, content, class: classes, **@options
      end

      private

      def classes
        class_names("stat", @options.delete(:class))
      end
    end
  end
end
