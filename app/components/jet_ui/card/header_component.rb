# frozen_string_literal: true

module JetUi
  module Card
    # The header section of a card component.
    #
    # @param title [String, nil] Bold heading text rendered at the top of the header
    # @param subtitle [String, nil] Smaller descriptive text below the title
    # @param align [Symbol] Content alignment: :left (default), :center, :right
    # @param bordered [Boolean] Adds a bottom border separating header from body (default: true)
    # @param options [Hash] Additional HTML attributes passed to the header element
    class HeaderComponent < BaseComponent
      ALIGN_CLASSES = {
        left:   "items-start",
        center: "items-center",
        right:  "items-end"
      }.freeze

      def initialize(title: nil, subtitle: nil, align: :left, bordered: true, **options)
        @title    = title
        @subtitle = subtitle
        @align    = align.to_sym
        @bordered = bordered
        @options  = options
      end

      def call
        content_tag(:div, class: classes, **@options) do
          concat content_tag(:strong, @title, class: "card__title")    if @title.present?
          concat content_tag(:span,   @subtitle, class: "card__subtitle") if @subtitle.present?
          concat content
        end
      end

      private

      def classes
        class_names(
          "card__header",
          ALIGN_CLASSES[@align],
          @options.delete(:class),
          "card__header-bordered": @bordered
        )
      end
    end
  end
end
