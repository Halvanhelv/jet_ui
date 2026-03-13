# frozen_string_literal: true

module JetUi
  # A card container component with optional header, body, and footer slots.
  #
  # @slot header [JetUi::Card::HeaderComponent] Optional card header
  # @slot footer [JetUi::Card::FooterComponent] Optional card footer
  # @slot body Wraps content in a padded body section
  # @param options [Hash] Additional HTML attributes passed to the card element
  #
  # @example Full card with all slots
  #   <%= render JetUi::CardComponent.new do |card| %>
  #     <% card.with_header(title: "My Card", subtitle: "Subtitle") %>
  #     <% card.with_body do %>
  #       Body content here
  #     <% end %>
  #     <% card.with_footer do %>
  #       <%= render JetUi::BtnComponent.new(variant: :primary) { "Save" } %>
  #     <% end %>
  #   <% end %>
  class CardComponent < BaseComponent
    renders_one :header, "JetUi::Card::HeaderComponent"
    renders_one :footer, "JetUi::Card::FooterComponent"
    renders_one :body

    def initialize(**options)
      @options = options
    end
  end
end
