# frozen_string_literal: true

# @label Card
class JetUi::Card::ComponentPreview < ViewComponent::Preview
  # @label Default (body only)
  def default
    render JetUi::Card::Component.new do
      render JetUi::Card::BodyComponent.new { "Card body content goes here." }
    end
  end

  # @label With header
  def with_header
    render JetUi::Card::Component.new do
      concat render(JetUi::Card::HeaderComponent.new) {
        render(JetUi::Card::TitleComponent.new) { "Card Title" }
      }
      concat render(JetUi::Card::BodyComponent.new) { "Body content." }
    end
  end

  # @label With header and subtitle
  def with_header_and_subtitle
    render JetUi::Card::Component.new do
      concat render(JetUi::Card::HeaderComponent.new) {
        concat render(JetUi::Card::TitleComponent.new) { "Card Title" }
        concat render(JetUi::Card::SubtitleComponent.new) { "A helpful subtitle" }
      }
      concat render(JetUi::Card::BodyComponent.new) { "Body content." }
    end
  end

  # @label With footer
  def with_footer
    render JetUi::Card::Component.new do
      concat render(JetUi::Card::BodyComponent.new) { "Body content." }
      concat render(JetUi::Card::FooterComponent.new) { "Footer content" }
    end
  end

  # @label Full card
  def full_card
    render JetUi::Card::Component.new do
      concat render(JetUi::Card::HeaderComponent.new) {
        concat render(JetUi::Card::TitleComponent.new) { "Full Card" }
        concat render(JetUi::Card::SubtitleComponent.new) { "With all sections" }
      }
      concat render(JetUi::Card::BodyComponent.new) { "Main content of the card." }
      concat render(JetUi::Card::FooterComponent.new) { "Footer content" }
    end
  end
end
