# frozen_string_literal: true

module JetUi
  module Accordion
    class SummaryComponent < JetUi::BaseComponent
      def initialize(icon: 'chevron-down', **options)
        @icon = icon
        @options = options
      end

      erb_template <<~ERB
        <summary class="<%= classes %>">
          <%= content %>
          <%= helpers.jet_ui.icon(@icon, class: icon_classes) if @icon %>
        </summary>
      ERB

      private

      def classes
        class_names('accordion__summary', @options[:class])
      end

      def icon_classes
        'accordion__icon'
      end
    end
  end
end
