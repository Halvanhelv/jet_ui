# frozen_string_literal: true

require 'test_helper'

class JetUi::Card::ComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Card::Component
  # ---------------------------------------------------------------------------
  def test_renders_card_container
    render_inline(JetUi::Card::Component.new) { 'Content' }

    assert_selector 'div.card'
  end

  def test_renders_content_directly
    render_inline(JetUi::Card::Component.new) { 'Body content' }

    assert_text 'Body content'
  end

  def test_passes_through_id
    render_inline(JetUi::Card::Component.new(id: 'my-card')) { '' }

    assert_selector 'div#my-card'
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::Card::Component.new(data: { testid: 'card' })) { '' }

    assert_selector "div[data-testid='card']"
  end

  def test_merges_custom_class
    render_inline(JetUi::Card::Component.new(class: 'shadow-lg')) { '' }

    assert_selector 'div.card.shadow-lg'
  end

  # ---------------------------------------------------------------------------
  # Card::HeaderComponent
  # ---------------------------------------------------------------------------
  def test_header_renders_element
    render_inline(JetUi::Card::HeaderComponent.new) { 'Header' }

    assert_selector 'div.card__header'
  end

  def test_header_bordered_by_default
    render_inline(JetUi::Card::HeaderComponent.new) { '' }

    assert_selector 'div.card__header-bordered'
  end

  def test_header_bordered_false_removes_class
    render_inline(JetUi::Card::HeaderComponent.new(bordered: false)) { '' }

    assert_no_selector '.card__header-bordered'
  end

  def test_header_renders_content
    render_inline(JetUi::Card::HeaderComponent.new) { 'My header content' }

    assert_text 'My header content'
  end

  def test_header_default_direction_col_has_no_modifier
    render_inline(JetUi::Card::HeaderComponent.new) { '' }

    assert_no_selector 'div.card__header--row'
  end

  def test_header_direction_row_applies_modifier
    render_inline(JetUi::Card::HeaderComponent.new(direction: :row)) { '' }

    assert_selector 'div.card__header--row'
  end

  def test_header_justify_between
    render_inline(JetUi::Card::HeaderComponent.new(justify: :between)) { '' }

    assert_selector 'div.card__header--justify-between'
  end

  def test_header_justify_end
    render_inline(JetUi::Card::HeaderComponent.new(justify: :end)) { '' }

    assert_selector 'div.card__header--justify-end'
  end

  def test_footer_default_direction_row_has_no_modifier
    render_inline(JetUi::Card::FooterComponent.new) { '' }

    assert_no_selector 'div.card__footer--col'
  end

  def test_footer_direction_col_applies_modifier
    render_inline(JetUi::Card::FooterComponent.new(direction: :col)) { '' }

    assert_selector 'div.card__footer--col'
  end

  def test_footer_justify_end
    render_inline(JetUi::Card::FooterComponent.new(justify: :end)) { '' }

    assert_selector 'div.card__footer--justify-end'
  end

  # ---------------------------------------------------------------------------
  # Card::BodyComponent
  # ---------------------------------------------------------------------------
  def test_body_renders_element
    render_inline(JetUi::Card::BodyComponent.new) { 'Body content' }

    assert_selector 'div.card__body'
  end

  def test_body_renders_content
    render_inline(JetUi::Card::BodyComponent.new) { 'Body content' }

    assert_text 'Body content'
  end

  def test_body_merges_custom_class
    render_inline(JetUi::Card::BodyComponent.new(class: 'p-8')) { '' }

    assert_selector 'div.card__body.p-8'
  end

  # ---------------------------------------------------------------------------
  # Card::FooterComponent
  # ---------------------------------------------------------------------------
  def test_footer_renders_element
    render_inline(JetUi::Card::FooterComponent.new) { 'Footer' }

    assert_selector 'div.card__footer'
  end

  def test_footer_bordered_by_default
    render_inline(JetUi::Card::FooterComponent.new) { '' }

    assert_selector 'div.card__footer-bordered'
  end

  def test_footer_bordered_false_removes_class
    render_inline(JetUi::Card::FooterComponent.new(bordered: false)) { '' }

    assert_no_selector '.card__footer-bordered'
  end

  def test_footer_default_direction_row_has_no_col_modifier
    render_inline(JetUi::Card::FooterComponent.new) { '' }

    assert_no_selector 'div.card__footer--col'
  end

  # ---------------------------------------------------------------------------
  # Card::TitleComponent
  # ---------------------------------------------------------------------------
  def test_title_renders_strong
    render_inline(JetUi::Card::TitleComponent.new) { 'My Title' }

    assert_selector 'strong.card__title', text: 'My Title'
  end

  def test_title_merges_custom_class
    render_inline(JetUi::Card::TitleComponent.new(class: 'text-xl')) { 'Title' }

    assert_selector 'strong.card__title.text-xl'
  end

  # ---------------------------------------------------------------------------
  # Card::SubtitleComponent
  # ---------------------------------------------------------------------------
  def test_subtitle_renders_span
    render_inline(JetUi::Card::SubtitleComponent.new) { 'A subtitle' }

    assert_selector 'span.card__subtitle', text: 'A subtitle'
  end

  def test_subtitle_merges_custom_class
    render_inline(JetUi::Card::SubtitleComponent.new(class: 'italic')) { 'Sub' }

    assert_selector 'span.card__subtitle.italic'
  end
end
