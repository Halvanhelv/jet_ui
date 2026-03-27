# frozen_string_literal: true

module JetUi
  module Card
    class FooterComponent < BaseComponent
      def initialize(direction: :row, align: :start, justify: :start, bordered: true, **options)
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
          "card__footer",
          direction_class,
          align_class,
          justify_class,
          { "card__footer-bordered": @bordered },
          @options.delete(:class)
        )
      end

      def direction_class
        "card__footer--col" if @direction == :col
      end

      def align_class
        { center: "card__footer--align-center", end: "card__footer--align-end" }[@align]
      end

      def justify_class
        {
          center:  "card__footer--justify-center",
          end:     "card__footer--justify-end",
          between: "card__footer--justify-between"
        }[@justify]
      end
    end
  end
end
