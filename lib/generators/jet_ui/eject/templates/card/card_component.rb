# frozen_string_literal: true

module JetUi
  # A card container component with optional header, body, and footer slots.
  #
  # @slot header [JetUi::Card::HeaderComponent] Optional card header
  # @slot footer [JetUi::Card::FooterComponent] Optional card footer
  # @slot body Wraps content in a padded body section
  # @param options [Hash] Additional HTML attributes passed to the card element
  class CardComponent < BaseComponent
    renders_one :header, "JetUi::Card::HeaderComponent"
    renders_one :footer, "JetUi::Card::FooterComponent"
    renders_one :body

    def initialize(**options)
      @options = options
    end
  end
end
