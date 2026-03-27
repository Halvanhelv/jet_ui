# frozen_string_literal: true

require "test_helper"

class JetUi::Badge::ComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Default rendering
  # ---------------------------------------------------------------------------
  def test_renders_span_element
    render_inline(JetUi::Badge::Component.new) { "New" }
    assert_selector "span"
  end

  def test_applies_base_badge_class
    render_inline(JetUi::Badge::Component.new) { "New" }
    assert_selector "span.badge"
  end

  def test_applies_default_variant
    render_inline(JetUi::Badge::Component.new) { "New" }
    assert_selector "span.badge-default"
  end

  def test_applies_default_size_sm
    render_inline(JetUi::Badge::Component.new) { "New" }
    assert_selector "span.badge-sm"
  end

  def test_renders_content
    render_inline(JetUi::Badge::Component.new) { "Active" }
    assert_text "Active"
  end

  # ---------------------------------------------------------------------------
  # Variants
  # ---------------------------------------------------------------------------
  JetUi::Badge::Component::VARIANTS.each do |variant|
    define_method(:"test_variant_#{variant}_applies_class") do
      render_inline(JetUi::Badge::Component.new(variant: variant)) { variant.to_s }
      assert_selector "span.badge-#{variant}"
    end
  end

  def test_unknown_variant_falls_back_to_default
    render_inline(JetUi::Badge::Component.new(variant: :nonexistent)) { "Badge" }
    assert_selector "span.badge-default"
  end

  # ---------------------------------------------------------------------------
  # Sizes
  # ---------------------------------------------------------------------------
  JetUi::Badge::Component::SIZES.each do |size|
    define_method(:"test_size_#{size}_applies_class") do
      render_inline(JetUi::Badge::Component.new(size: size)) { "Badge" }
      assert_selector "span.badge-#{size}"
    end
  end

  def test_unknown_size_falls_back_to_sm
    render_inline(JetUi::Badge::Component.new(size: :huge)) { "Badge" }
    assert_selector "span.badge-sm"
  end

  # ---------------------------------------------------------------------------
  # Rounded modifier
  # ---------------------------------------------------------------------------
  def test_rounded_adds_badge_rounded_class
    render_inline(JetUi::Badge::Component.new(rounded: true)) { "Badge" }
    assert_selector "span.badge-rounded"
  end

  def test_not_rounded_by_default
    render_inline(JetUi::Badge::Component.new) { "Badge" }
    assert_no_selector "span.badge-rounded"
  end

  # ---------------------------------------------------------------------------
  # HTML passthrough
  # ---------------------------------------------------------------------------
  def test_passes_through_id
    render_inline(JetUi::Badge::Component.new(id: "status")) { "Active" }
    assert_selector "span#status"
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::Badge::Component.new(data: { testid: "badge" })) { "Active" }
    assert_selector "span[data-testid='badge']"
  end

  def test_merges_custom_class
    render_inline(JetUi::Badge::Component.new(class: "uppercase")) { "Active" }
    assert_selector "span.badge.uppercase"
  end
end
