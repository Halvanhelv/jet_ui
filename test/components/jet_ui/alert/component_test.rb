# frozen_string_literal: true

require 'test_helper'

class JetUi::Alert::ComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Alert::Component
  # ---------------------------------------------------------------------------
  def test_renders_div_element
    render_inline(JetUi::Alert::Component.new) { 'Something went wrong' }

    assert_selector 'div'
  end

  def test_applies_base_alert_class
    render_inline(JetUi::Alert::Component.new) { 'Message' }

    assert_selector 'div.alert'
  end

  def test_applies_default_variant
    render_inline(JetUi::Alert::Component.new) { 'Message' }

    assert_selector 'div.alert-default'
  end

  def test_renders_content
    render_inline(JetUi::Alert::Component.new) { 'Watch out!' }

    assert_text 'Watch out!'
  end

  JetUi::Alert::Component::VARIANTS.each do |variant|
    define_method(:"test_variant_#{variant}_applies_class") do
      render_inline(JetUi::Alert::Component.new(variant: variant)) { variant.to_s }

      assert_selector "div.alert-#{variant}"
    end
  end

  def test_unknown_variant_falls_back_to_default
    render_inline(JetUi::Alert::Component.new(variant: :nonexistent)) { 'Alert' }

    assert_selector 'div.alert-default'
  end

  def test_passes_through_id
    render_inline(JetUi::Alert::Component.new(id: 'notice')) { 'Notice' }

    assert_selector 'div#notice'
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::Alert::Component.new(data: { testid: 'alert' })) { 'Alert' }

    assert_selector "div[data-testid='alert']"
  end

  def test_merges_custom_class
    render_inline(JetUi::Alert::Component.new(class: 'mt-4')) { 'Alert' }

    assert_selector 'div.alert.mt-4'
  end

  # ---------------------------------------------------------------------------
  # Alert::TitleComponent
  # ---------------------------------------------------------------------------
  def test_title_renders_strong_element
    render_inline(JetUi::Alert::TitleComponent.new) { 'Error' }

    assert_selector 'strong'
  end

  def test_title_applies_alert_title_class
    render_inline(JetUi::Alert::TitleComponent.new) { 'Error' }

    assert_selector 'strong.alert__title'
  end

  def test_title_renders_content
    render_inline(JetUi::Alert::TitleComponent.new) { 'Something went wrong' }

    assert_text 'Something went wrong'
  end

  def test_title_merges_custom_class
    render_inline(JetUi::Alert::TitleComponent.new(class: 'uppercase')) { 'Error' }

    assert_selector 'strong.alert__title.uppercase'
  end

  # ---------------------------------------------------------------------------
  # Alert::DescriptionComponent
  # ---------------------------------------------------------------------------
  def test_description_renders_div_element
    render_inline(JetUi::Alert::DescriptionComponent.new) { 'Details here' }

    assert_selector 'div'
  end

  def test_description_applies_alert_description_class
    render_inline(JetUi::Alert::DescriptionComponent.new) { 'Details' }

    assert_selector 'div.alert__description'
  end

  def test_description_renders_content
    render_inline(JetUi::Alert::DescriptionComponent.new) { 'More info about the error' }

    assert_text 'More info about the error'
  end

  def test_description_merges_custom_class
    render_inline(JetUi::Alert::DescriptionComponent.new(class: 'text-xs')) { 'Details' }

    assert_selector 'div.alert__description.text-xs'
  end

  # ---------------------------------------------------------------------------
  # Alert::IconComponent
  # ---------------------------------------------------------------------------
  def test_icon_renders_span_element
    render_inline(JetUi::Alert::IconComponent.new) { '!' }

    assert_selector 'span'
  end

  def test_icon_applies_alert_icon_class
    render_inline(JetUi::Alert::IconComponent.new) { '!' }

    assert_selector 'span.alert__icon'
  end

  def test_icon_renders_content
    render_inline(JetUi::Alert::IconComponent.new) { 'icon-content' }

    assert_text 'icon-content'
  end
end
