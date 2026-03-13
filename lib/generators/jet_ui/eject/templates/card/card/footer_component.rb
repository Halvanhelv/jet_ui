# frozen_string_literal: true

module JetUi
  module Card
    # The footer section of a card component.
    #
    # @param align [Symbol] Content alignment: :left, :center, :right (default)
    # @param bordered [Boolean] Adds a top border separating footer from body (default: true)
    # @param options [Hash] Additional HTML attributes passed to the footer element
    class FooterComponent < BaseComponent
      ALIGN_CLASSES = {
        left:   "items-start",
        center: "items-center",
        right:  "items-end"
      }.freeze

      def initialize(align: :right, bordered: true, **options)
        @align    = align.to_sym
        @bordered = bordered
        @options  = options
      end

      def call
        content_tag(:div, content, class: classes, **@options)
      end

      private

      def classes
        class_names(
          "card__footer",
          ALIGN_CLASSES[@align],
          @options.delete(:class),
          "card__footer-bordered": @bordered
        )
      end
    end
  end
end
