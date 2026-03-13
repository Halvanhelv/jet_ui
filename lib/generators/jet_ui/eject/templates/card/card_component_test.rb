# frozen_string_literal: true

require "test_helper"

class JetUi::CardComponentTest < ViewComponent::TestCase
  def test_renders_card_container
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Body content" }
    end
    assert_selector "div.card"
  end

  def test_body_slot
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Body content" }
    end
    assert_selector ".card__body", text: "Body content"
  end

  def test_header_slot
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", subtitle: "Subtitle")
    end
    assert_selector "strong.card__title", text: "Title"
    assert_selector "span.card__subtitle", text: "Subtitle"
  end

  def test_footer_slot
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer { "Footer" }
    end
    assert_selector ".card__footer", text: "Footer"
  end
end
