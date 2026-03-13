# frozen_string_literal: true

# @label Card
class JetUi::CardComponentPreview < ViewComponent::Preview
  # @label Default (body only)
  def default
    render JetUi::CardComponent.new do |card|
      card.with_body { "Card body content goes here." }
    end
  end

  # @label With header (title only)
  def with_header_title
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Card Title")
      card.with_body { "Body content." }
    end
  end

  # @label With header (title and subtitle)
  def with_header_title_and_subtitle
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Card Title", subtitle: "A helpful subtitle")
      card.with_body { "Body content." }
    end
  end

  # @label With unborderd header
  def with_header_unborderd
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "No Border", bordered: false)
      card.with_body { "Body content." }
    end
  end

  # @label With footer
  def with_footer
    render JetUi::CardComponent.new do |card|
      card.with_body { "Body content." }
      card.with_footer { "Footer content" }
    end
  end

  # @label Full card (header + body + footer)
  def full_card
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Full Card", subtitle: "With all sections")
      card.with_body { "Main content of the card." }
      card.with_footer { "Footer content" }
    end
  end

  # @label Header center aligned
  def header_center_aligned
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Centered", subtitle: "Centered subtitle", align: :center)
      card.with_body { "Body content." }
    end
  end

  # @label Footer left aligned
  def footer_left_aligned
    render JetUi::CardComponent.new do |card|
      card.with_body { "Body content." }
      card.with_footer(align: :left) { "Left-aligned footer" }
    end
  end

  # @label Footer unborderd
  def footer_unborderd
    render JetUi::CardComponent.new do |card|
      card.with_body { "Body content." }
      card.with_footer(bordered: false) { "No border footer" }
    end
  end

  # @label No body (direct content)
  def no_body_slot
    render JetUi::CardComponent.new do |card|
      card.with_header(title: "Direct Content")
    end
  end
end
