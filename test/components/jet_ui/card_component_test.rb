# frozen_string_literal: true

require "test_helper"

class JetUi::CardComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Basic rendering
  # ---------------------------------------------------------------------------
  def test_renders_card_container
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Card body content" }
    end
    assert_selector "div.card"
  end

  def test_renders_body_inside_card_body
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Card body content" }
    end
    assert_selector ".card__body", text: "Card body content"
  end

  def test_no_header_without_header_slot
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Body" }
    end
    assert_no_selector ".card__header"
  end

  def test_no_footer_without_footer_slot
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_body { "Body" }
    end
    assert_no_selector ".card__footer"
  end

  def test_no_body_wrapper_without_body_slot
    render_inline(JetUi::CardComponent.new)
    assert_no_selector ".card__body"
  end

  # ---------------------------------------------------------------------------
  # Header slot
  # ---------------------------------------------------------------------------
  def test_header_renders_card_header_element
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "My Title")
    end
    assert_selector ".card__header"
  end

  def test_header_renders_title
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "My Title")
    end
    assert_selector "strong.card__title", text: "My Title"
  end

  def test_header_is_bordered_by_default
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title")
    end
    assert_selector ".card__header.card__header-bordered"
  end

  def test_header_renders_subtitle
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", subtitle: "Subtitle text")
    end
    assert_selector "span.card__subtitle", text: "Subtitle text"
  end

  def test_header_bordered_false_removes_border_class
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", bordered: false)
    end
    assert_no_selector ".card__header-bordered"
  end

  def test_header_align_center
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", align: :center)
    end
    assert_selector ".card__header.items-center"
  end

  def test_header_align_right
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", align: :right)
    end
    assert_selector ".card__header.items-end"
  end

  def test_header_align_left
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Title", align: :left)
    end
    assert_selector ".card__header.items-start"
  end

  # ---------------------------------------------------------------------------
  # Footer slot
  # ---------------------------------------------------------------------------
  def test_footer_renders_card_footer_element
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer { "Footer content" }
    end
    assert_selector ".card__footer", text: "Footer content"
  end

  def test_footer_is_bordered_by_default
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer { "Footer" }
    end
    assert_selector ".card__footer.card__footer-bordered"
  end

  def test_footer_aligns_right_by_default
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer { "Footer" }
    end
    assert_selector ".card__footer.items-end"
  end

  def test_footer_bordered_false_removes_border_class
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer(bordered: false) { "Footer" }
    end
    assert_no_selector ".card__footer-bordered"
  end

  def test_footer_align_left
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer(align: :left) { "Footer" }
    end
    assert_selector ".card__footer.items-start"
  end

  def test_footer_align_center
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_footer(align: :center) { "Footer" }
    end
    assert_selector ".card__footer.items-center"
  end

  # ---------------------------------------------------------------------------
  # Full card with all slots
  # ---------------------------------------------------------------------------
  def test_full_card_renders_all_slots
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Full Card", subtitle: "Subtitle")
      card.with_body { "Body content" }
      card.with_footer { "Footer content" }
    end
    assert_selector ".card__header"
    assert_selector ".card__body"
    assert_selector ".card__footer"
  end

  def test_full_card_renders_all_text
    render_inline(JetUi::CardComponent.new) do |card|
      card.with_header(title: "Full Card", subtitle: "Subtitle")
      card.with_body { "Body content" }
      card.with_footer { "Footer content" }
    end
    assert_text "Full Card"
    assert_text "Subtitle"
    assert_text "Body content"
    assert_text "Footer content"
  end

  # ---------------------------------------------------------------------------
  # HTML attribute passthrough
  # ---------------------------------------------------------------------------
  def test_passes_through_id
    render_inline(JetUi::CardComponent.new(id: "my-card"))
    assert_selector "div#my-card"
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::CardComponent.new(data: { testid: "card" }))
    assert_selector "div[data-testid='card']"
  end

  # ---------------------------------------------------------------------------
  # Custom class merging
  # ---------------------------------------------------------------------------
  def test_custom_class_keeps_base_class
    render_inline(JetUi::CardComponent.new(class: "shadow-lg"))
    assert_selector "div.card"
  end

  def test_custom_class_is_included
    render_inline(JetUi::CardComponent.new(class: "shadow-lg"))
    assert_selector "div.shadow-lg"
  end
end
