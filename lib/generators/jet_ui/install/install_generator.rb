# frozen_string_literal: true

require "rails/generators"

module JetUi
  module Generators
    # Sets up JetUi in the host Rails application.
    #
    # Usage:
    #   rails generate jet_ui:install
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Installs JetUi into your Rails application."

      def inject_css
        if (file = tailwind_source_file)
          content = File.read(File.join(destination_root, file))
          if content.include?("jet_ui")
            say "  JetUi CSS already imported in #{file}", :yellow
          else
            # Tailwind CSS v4: import each file with an absolute path so the
            # Tailwind CLI can process @apply directives at build time.
            append_to_file file, tailwind_imports
            say "  Injected JetUi imports into #{file}", :green
          end
        else
          say "  Could not detect a Tailwind CSS source file.", :yellow
          say "  Add the following to your Tailwind CSS source manually:", :yellow
          say tailwind_imports, :yellow
        end
      end

      def show_usage
        say "\nJetUi installed!\n", :green
        say "Usage in your views:"
        say %(  <%= render JetUi::BtnComponent.new(variant: :primary) { "Save" } %>)
        say %(  <%= render JetUi::CardComponent.new do |card| %>)
        say %(       <% card.with_header(title: "Hello") %>)
        say %(       <% card.with_body { "Content" } %>)
        say %(  <% end %>\n)
        say "To eject a component for local customization:"
        say "  rails generate jet_ui:eject btn"
        say "  rails generate jet_ui:eject card"
        say "  rails generate jet_ui:eject btn card\n"
      end

      private

      TAILWIND_SOURCE_FILES = %w[
        app/assets/tailwind/application.css
        app/assets/stylesheets/application.tailwind.css
        app/assets/stylesheets/application.postcss.css
      ].freeze

      def tailwind_source_file
        TAILWIND_SOURCE_FILES.find { |f| File.exist?(File.join(destination_root, f)) }
      end

      def gem_stylesheets_path
        spec = Gem::Specification.find_by_name("jet_ui") rescue nil
        base = spec&.gem_dir || File.expand_path("../../../../..", __dir__)
        File.join(base, "app/assets/stylesheets/jet_ui")
      end

      def tailwind_imports
        path = gem_stylesheets_path
        components = Dir[File.join(path, "*.css")]
          .reject { |f| File.basename(f) == "theme.css" }
          .map { |f| %(\n@import "#{f}";) }
          .join

        %(\n@import "#{File.join(path, "theme.css")}";) + components + "\n"
      end
    end
  end
end
