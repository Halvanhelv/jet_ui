# frozen_string_literal: true

require "test_helper"

class JetUi::BtnComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Default (no variant)
  # ---------------------------------------------------------------------------
  def test_renders_button_element
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button"
  end

  def test_has_type_button
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button[type='button']"
  end

  def test_applies_base_btn_class
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button.btn"
  end

  def test_applies_default_size_md
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button.btn-md"
  end

  def test_renders_content
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_text "Click me"
  end

  # ---------------------------------------------------------------------------
  # Variants
  # ---------------------------------------------------------------------------
  JetUi::BtnComponent::VARIANTS.each do |variant|
    define_method(:"test_variant_#{variant}_applies_class") do
      render_inline(JetUi::BtnComponent.new(variant: variant)) { variant.to_s }
      assert_selector "button.btn-#{variant}"
    end
  end

  # ---------------------------------------------------------------------------
  # Sizes
  # ---------------------------------------------------------------------------
  JetUi::BtnComponent::SIZES.each do |size|
    define_method(:"test_size_#{size}_applies_class") do
      render_inline(JetUi::BtnComponent.new(size: size)) { "Button" }
      assert_selector "button.btn-#{size}"
    end
  end

  # ---------------------------------------------------------------------------
  # Modifiers
  # ---------------------------------------------------------------------------
  def test_rounded_modifier
    render_inline(JetUi::BtnComponent.new(rounded: true)) { "Button" }
    assert_selector "button.btn-rounded"
  end

  def test_block_modifier
    render_inline(JetUi::BtnComponent.new(block: true)) { "Button" }
    assert_selector "button.btn-block"
  end

  def test_circle_modifier
    render_inline(JetUi::BtnComponent.new(circle: true)) { "Button" }
    assert_selector "button.btn-circle"
  end

  def test_outlined_modifier
    render_inline(JetUi::BtnComponent.new(variant: :primary, outlined: true)) { "Button" }
    assert_selector "button.btn-outlined"
  end

  # ---------------------------------------------------------------------------
  # href renders as <a>
  # ---------------------------------------------------------------------------
  def test_href_renders_anchor
    render_inline(JetUi::BtnComponent.new(variant: :primary, href: "/home")) { "Home" }
    assert_selector "a"
    assert_no_selector "button"
  end

  def test_href_sets_correct_href
    render_inline(JetUi::BtnComponent.new(variant: :primary, href: "/home")) { "Home" }
    assert_selector "a[href='/home']"
  end

  def test_href_keeps_btn_classes
    render_inline(JetUi::BtnComponent.new(variant: :primary, href: "/home")) { "Home" }
    assert_selector "a.btn.btn-primary"
  end

  # ---------------------------------------------------------------------------
  # HTML attribute passthrough
  # ---------------------------------------------------------------------------
  def test_passes_through_id
    render_inline(JetUi::BtnComponent.new(variant: :danger, id: "delete-btn")) { "Delete" }
    assert_selector "button#delete-btn"
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::BtnComponent.new(variant: :danger, data: { confirm: "Sure?" })) { "Delete" }
    assert_selector "button[data-confirm='Sure?']"
  end

  # ---------------------------------------------------------------------------
  # Custom class merging
  # ---------------------------------------------------------------------------
  def test_custom_class_keeps_base_class
    render_inline(JetUi::BtnComponent.new(class: "mt-4")) { "Button" }
    assert_selector "button.btn"
  end

  def test_custom_class_is_included
    render_inline(JetUi::BtnComponent.new(class: "mt-4")) { "Button" }
    assert_selector "button.mt-4"
  end
end
