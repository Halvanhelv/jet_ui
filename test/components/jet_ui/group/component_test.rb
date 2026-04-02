# frozen_string_literal: true

require 'test_helper'

class JetUi::Group::ComponentTest < ViewComponent::TestCase
  # ---------------------------------------------------------------------------
  # Default rendering
  # ---------------------------------------------------------------------------
  def test_renders_div_element
    render_inline(JetUi::Group::Component.new) { 'buttons' }

    assert_selector 'div'
  end

  def test_applies_base_ui_group_class
    render_inline(JetUi::Group::Component.new) { 'buttons' }

    assert_selector 'div.ui_group'
  end

  def test_renders_content
    render_inline(JetUi::Group::Component.new) { 'group content' }

    assert_text 'group content'
  end

  # ---------------------------------------------------------------------------
  # Sticky modifier
  # ---------------------------------------------------------------------------
  def test_sticky_by_default
    render_inline(JetUi::Group::Component.new) { '' }

    assert_selector 'div.ui_group-sticky'
  end

  def test_sticky_true_applies_sticky_class
    render_inline(JetUi::Group::Component.new(sticky: true)) { '' }

    assert_selector 'div.ui_group-sticky'
  end

  def test_sticky_false_omits_sticky_class
    render_inline(JetUi::Group::Component.new(sticky: false)) { '' }

    assert_no_selector 'div.ui_group-sticky'
  end

  # ---------------------------------------------------------------------------
  # HTML passthrough
  # ---------------------------------------------------------------------------
  def test_passes_through_id
    render_inline(JetUi::Group::Component.new(id: 'actions')) { '' }

    assert_selector 'div#actions'
  end

  def test_passes_through_data_attributes
    render_inline(JetUi::Group::Component.new(data: { testid: 'group' })) { '' }

    assert_selector "div[data-testid='group']"
  end

  def test_merges_custom_class
    render_inline(JetUi::Group::Component.new(class: 'mt-4')) { '' }

    assert_selector 'div.ui_group.mt-4'
  end
end
