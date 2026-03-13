# frozen_string_literal: true

module JetUi
  # A versatile button component supporting multiple variants, sizes, and modifiers.
  #
  # @param variant [Symbol, nil] Visual style: :primary, :secondary, :danger, :ghost, :link
  # @param href [String, nil] When provided, renders an <a> tag instead of <button>
  # @param size [Symbol] Button size: :xs, :sm, :md (default), :lg, :xl
  # @param rounded [Boolean] Applies full rounded corners (pill shape)
  # @param block [Boolean] Makes the button full-width
  # @param circle [Boolean] Renders the button as a circle (icon-only)
  # @param outlined [Boolean] Renders an outlined/ghost variant of the chosen variant color
  # @param options [Hash] Additional HTML attributes passed to the element
  #
  # @example Primary button
  #   <%= render JetUi::BtnComponent.new(variant: :primary) do %>
  #     Save
  #   <% end %>
  #
  # @example Link button with href
  #   <%= render JetUi::BtnComponent.new(href: root_path, variant: :secondary) do %>
  #     Go home
  #   <% end %>
  class BtnComponent < BaseComponent
    SIZES = %i[xs sm md lg xl].freeze
    DEFAULT_SIZE = :md

    VARIANTS = %i[primary secondary danger ghost link].freeze

    VARIANT_CLASSES = {
      primary:   "btn-primary",
      secondary: "btn-secondary",
      danger:    "btn-danger",
      ghost:     "btn-ghost",
      link:      "btn-link"
    }.freeze

    ICON_SIZES = {
      xs: 2,
      sm: 3,
      md: 4,
      lg: 5,
      xl: 6
    }.freeze

    def initialize(variant: nil, href: nil, size: DEFAULT_SIZE, rounded: false, block: false, circle: false, outlined: false, **options)
      @variant  = variant
      @href     = href
      @size     = size.to_sym
      @rounded  = rounded
      @block    = block
      @circle   = circle
      @outlined = outlined
      @options  = options
    end

    def call
      if @href
        link_to(component_content, @href, **button_attributes)
      else
        button_tag(component_content, **button_attributes)
      end
    end

    private

    def component_content
      content
    end

    def button_attributes
      css_classes = class_names(
        "btn",
        VARIANT_CLASSES[@variant],
        @options.delete(:class),
        "btn-#{@size}",
        "btn-block":    @block,
        "btn-rounded":  @rounded,
        "btn-circle":   @circle,
        "btn-outlined": @outlined
      )

      {
        type: "button",
        class: css_classes,
        **@options
      }
    end
  end
end
