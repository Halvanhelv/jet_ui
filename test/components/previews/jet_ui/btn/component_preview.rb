# frozen_string_literal: true

# @label Btn
class JetUi::Btn::ComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render(JetUi::Btn::Component.new { 'Button' })
  end

  # @label Outline
  def outline
    render JetUi::Btn::Component.new(variant: :outline) { 'Outline' }
  end

  # @label Secondary
  def secondary
    render JetUi::Btn::Component.new(variant: :secondary) { 'Secondary' }
  end

  # @label Danger
  def danger
    render JetUi::Btn::Component.new(variant: :danger) { 'Danger' }
  end

  # @label Ghost
  def ghost
    render JetUi::Btn::Component.new(variant: :ghost) { 'Ghost' }
  end

  # @label Link
  def link_variant
    render JetUi::Btn::Component.new(variant: :link) { 'Link' }
  end

  # @label Size XS
  def size_xs
    render JetUi::Btn::Component.new(size: :xs) { 'Extra Small' }
  end

  # @label Size SM
  def size_sm
    render JetUi::Btn::Component.new(size: :sm) { 'Small' }
  end

  # @label Size MD (default)
  def size_md
    render JetUi::Btn::Component.new(size: :md) { 'Medium' }
  end

  # @label Size LG
  def size_lg
    render JetUi::Btn::Component.new(size: :lg) { 'Large' }
  end

  # @label Rounded
  def rounded
    render JetUi::Btn::Component.new(rounded: true) { 'Rounded' }
  end

  # @label Block (full width)
  def block
    render JetUi::Btn::Component.new(block: true) { 'Block Button' }
  end

  # @label As link (url)
  def as_link
    render JetUi::Btn::Component.new(url: '#') { 'Link Button' }
  end

  # @label With data attributes
  def with_data_attributes
    render JetUi::Btn::Component.new(variant: :danger, data: { confirm: 'Are you sure?' }) { 'Delete' }
  end
end
