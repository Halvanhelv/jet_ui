# frozen_string_literal: true

require "test_helper"

class JetUi::BtnComponentTest < ViewComponent::TestCase
  def test_renders_button_with_base_class
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button.btn"
  end

  def test_applies_default_size_md
    render_inline(JetUi::BtnComponent.new) { "Click me" }
    assert_selector "button.btn-md"
  end

  JetUi::BtnComponent::VARIANTS.each do |variant|
    define_method(:"test_variant_#{variant}") do
      render_inline(JetUi::BtnComponent.new(variant: variant)) { variant.to_s }
      assert_selector "button.btn-#{variant}"
    end
  end

  JetUi::BtnComponent::SIZES.each do |size|
    define_method(:"test_size_#{size}") do
      render_inline(JetUi::BtnComponent.new(size: size)) { "Button" }
      assert_selector "button.btn-#{size}"
    end
  end

  def test_href_renders_anchor
    render_inline(JetUi::BtnComponent.new(href: "/path")) { "Link" }
    assert_selector "a.btn[href='/path']"
  end
end
