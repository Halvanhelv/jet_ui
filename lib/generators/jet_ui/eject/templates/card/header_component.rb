# frozen_string_literal: true

module JetUi
  module Card
    class HeaderComponent < BaseComponent
      def initialize(direction: :col, align: :start, justify: :start, bordered: true, **options)
        @direction = direction
        @align = align
        @justify = justify
        @bordered = bordered
        @options = options
      end

      def call
        content_tag(:div, content, class: classes, **@options)
      end

      private

      def classes
        class_names(
          "card__header",
          direction_class,
          align_class,
          justify_class,
          { "card__header-bordered": @bordered },
          @options.delete(:class)
        )
      end

      def direction_class
        "card__header--row" if @direction == :row
      end

      def align_class
        { center: "card__header--align-center", end: "card__header--align-end" }[@align]
      end

      def justify_class
        {
          center:  "card__header--justify-center",
          end:     "card__header--justify-end",
          between: "card__header--justify-between"
        }[@justify]
      end
    end
  end
end
