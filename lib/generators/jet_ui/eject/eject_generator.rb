# frozen_string_literal: true

require "rails/generators"

module JetUi
  module Generators
    # Ejects one or more JetUi components into the host application so they
    # can be customised locally. The ejected files take precedence over the
    # gem's built-in versions.
    #
    # Usage:
    #   rails generate jet_ui:eject btn
    #   rails generate jet_ui:eject card
    #   rails generate jet_ui:eject btn card
    class EjectGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      argument :components, type: :array, banner: "component [component ...]",
                            desc: "Component(s) to eject (e.g. btn card)"

      desc "Ejects JetUi component(s) into your application for local customisation."

      MANIFEST = {
        "btn" => {
          files: [
            { src: "btn/btn_component.rb",          dest: "app/components/jet_ui/btn_component.rb" },
            { src: "btn/btn.css",                   dest: "app/assets/stylesheets/jet_ui/btn.css" },
            { src: "btn/btn_component_test.rb",     dest: "test/components/jet_ui/btn_component_test.rb" },
            { src: "btn/btn_component_preview.rb",  dest: "test/components/previews/jet_ui/btn_component_preview.rb" }
          ]
        },
        "card" => {
          files: [
            { src: "card/card_component.rb",              dest: "app/components/jet_ui/card_component.rb" },
            { src: "card/card_component.html.erb",        dest: "app/components/jet_ui/card_component.html.erb" },
            { src: "card/card/header_component.rb",       dest: "app/components/jet_ui/card/header_component.rb" },
            { src: "card/card/footer_component.rb",       dest: "app/components/jet_ui/card/footer_component.rb" },
            { src: "card/card.css",                       dest: "app/assets/stylesheets/jet_ui/card.css" },
            { src: "card/card_component_test.rb",         dest: "test/components/jet_ui/card_component_test.rb" },
            { src: "card/card_component_preview.rb",      dest: "test/components/previews/jet_ui/card_component_preview.rb" }
          ]
        }
      }.freeze

      def eject_components
        unknown = components.map(&:downcase) - MANIFEST.keys
        if unknown.any?
          say "\nUnknown component(s): #{unknown.join(", ")}", :red
          say "Available: #{MANIFEST.keys.join(", ")}\n", :red
          exit 1
        end

        components.map(&:downcase).each do |name|
          say "\nEjecting #{name}...", :cyan
          MANIFEST[name][:files].each do |entry|
            template entry[:src], entry[:dest]
          end
          say "  #{name} ejected.", :green
        end
      end

      def show_summary
        say "\nDone! Ejected: #{components.map(&:downcase).join(", ")}\n", :green
        say "The local files in app/components/jet_ui/ now take precedence over the gem."
        say "Run your tests to confirm everything still works:\n"
        say "  bundle exec rake test\n"
      end
    end
  end
end
