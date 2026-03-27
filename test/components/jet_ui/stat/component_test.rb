# frozen_string_literal: true

require "test_helper"

class JetUi::Stat::ComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Stat::Component
  # ---------------------------------------------------------------------------
  def test_renders_div_element
    render_inline(JetUi::Stat::Component.new) { "content" }
    assert_selector "div"
  end

  def test_applies_stat_class
    render_inline(JetUi::Stat::Component.new) { "content" }
    assert_selector "div.stat"
  end

  def test_renders_content
    render_inline(JetUi::Stat::Component.new) { "stat content" }
    assert_text "stat content"
  end

  def test_passes_through_id
    render_inline(JetUi::Stat::Component.new(id: "revenue")) { "" }
    assert_selector "div#revenue"
  end

  def test_merges_custom_class
    render_inline(JetUi::Stat::Component.new(class: "col-span-2")) { "" }
    assert_selector "div.stat.col-span-2"
  end

  # ---------------------------------------------------------------------------
  # Stat::LabelComponent
  # ---------------------------------------------------------------------------
  def test_label_renders_p_element
    render_inline(JetUi::Stat::LabelComponent.new) { "Total Revenue" }
    assert_selector "p"
  end

  def test_label_applies_stat_label_class
    render_inline(JetUi::Stat::LabelComponent.new) { "Total Revenue" }
    assert_selector "p.stat__label"
  end

  def test_label_renders_content
    render_inline(JetUi::Stat::LabelComponent.new) { "Monthly Users" }
    assert_text "Monthly Users"
  end

  def test_label_merges_custom_class
    render_inline(JetUi::Stat::LabelComponent.new(class: "uppercase")) { "Revenue" }
    assert_selector "p.stat__label.uppercase"
  end

  # ---------------------------------------------------------------------------
  # Stat::ValueComponent
  # ---------------------------------------------------------------------------
  def test_value_renders_p_element
    render_inline(JetUi::Stat::ValueComponent.new) { "$12,345" }
    assert_selector "p"
  end

  def test_value_applies_stat_value_class
    render_inline(JetUi::Stat::ValueComponent.new) { "$12,345" }
    assert_selector "p.stat__value"
  end

  def test_value_renders_content
    render_inline(JetUi::Stat::ValueComponent.new) { "99,999" }
    assert_text "99,999"
  end

  def test_value_merges_custom_class
    render_inline(JetUi::Stat::ValueComponent.new(class: "text-accent")) { "$100" }
    assert_selector "p.stat__value.text-accent"
  end

  # ---------------------------------------------------------------------------
  # Stat::DescriptionComponent
  # ---------------------------------------------------------------------------
  def test_description_renders_p_element
    render_inline(JetUi::Stat::DescriptionComponent.new) { "vs last month" }
    assert_selector "p"
  end

  def test_description_applies_stat_description_class
    render_inline(JetUi::Stat::DescriptionComponent.new) { "vs last month" }
    assert_selector "p.stat__description"
  end

  def test_description_default_variant_no_modifier_class
    render_inline(JetUi::Stat::DescriptionComponent.new) { "vs last month" }
    assert_no_selector "p.stat__description--success"
    assert_no_selector "p.stat__description--warning"
    assert_no_selector "p.stat__description--error"
  end

  def test_description_renders_content
    render_inline(JetUi::Stat::DescriptionComponent.new) { "+12% this week" }
    assert_text "+12% this week"
  end

  JetUi::Stat::DescriptionComponent::VARIANTS.reject { |v| v == :default }.each do |variant|
    define_method(:"test_description_variant_#{variant}_applies_modifier_class") do
      render_inline(JetUi::Stat::DescriptionComponent.new(variant: variant)) { "trend" }
      assert_selector "p.stat__description--#{variant}"
    end
  end

  def test_description_unknown_variant_falls_back_to_default
    render_inline(JetUi::Stat::DescriptionComponent.new(variant: :unknown)) { "trend" }
    assert_no_selector "p[class*='stat__description--']"
  end

  def test_description_merges_custom_class
    render_inline(JetUi::Stat::DescriptionComponent.new(class: "mt-4")) { "trend" }
    assert_selector "p.stat__description.mt-4"
  end

  def test_description_default_renders_no_icon
    render_inline(JetUi::Stat::DescriptionComponent.new) { "neutral" }
    assert_no_selector "svg"
  end

  def test_description_success_renders_svg_icon
    render_inline(JetUi::Stat::DescriptionComponent.new(variant: :success)) { "up" }
    assert_selector "p.stat__description svg"
  end

  def test_description_error_renders_svg_icon
    render_inline(JetUi::Stat::DescriptionComponent.new(variant: :error)) { "down" }
    assert_selector "p.stat__description svg"
  end

  def test_description_warning_renders_svg_icon
    render_inline(JetUi::Stat::DescriptionComponent.new(variant: :warning)) { "down" }
    assert_selector "p.stat__description svg"
  end
end
