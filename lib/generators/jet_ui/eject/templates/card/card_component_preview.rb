# frozen_string_literal: true

# @label Card
class JetUi::CardComponentPreview < ViewComponent::Preview
  def default
    render JetUi::CardComponent.new do |card|
      card.with_body { "Card body content goes here." }
    end
  end

  def with_header
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Card Title", subtitle: "A helpful subtitle")
      card.with_body { "Body content." }
    end
  end

  def full_card
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Full Card", subtitle: "With all sections")
      card.with_body { "Main content of the card." }
      card.with_footer { "Footer content" }
    end
  end
end
