# frozen_string_literal: true

require "test_helper"

class JetUi::Card::ComponentTest < ViewComponent::TestCase
  def test_renders_card_container
    render_inline(JetUi::Card::Component.new) { "Content" }
    assert_selector "div.card"
  end

  def test_renders_body
    render_inline(JetUi::Card::BodyComponent.new) { "Body content" }
    assert_selector "div.card__body", text: "Body content"
  end

  def test_renders_header
    render_inline(JetUi::Card::HeaderComponent.new) { "" }
    assert_selector "div.card__header"
  end

  def test_header_bordered_by_default
    render_inline(JetUi::Card::HeaderComponent.new) { "" }
    assert_selector "div.card__header-bordered"
  end

  def test_renders_footer
    render_inline(JetUi::Card::FooterComponent.new) { "Footer" }
    assert_selector "div.card__footer"
  end

  def test_footer_bordered_by_default
    render_inline(JetUi::Card::FooterComponent.new) { "" }
    assert_selector "div.card__footer-bordered"
  end

  def test_renders_title
    render_inline(JetUi::Card::TitleComponent.new) { "My Title" }
    assert_selector "strong.card__title", text: "My Title"
  end

  def test_renders_subtitle
    render_inline(JetUi::Card::SubtitleComponent.new) { "A subtitle" }
    assert_selector "span.card__subtitle", text: "A subtitle"
  end
end
