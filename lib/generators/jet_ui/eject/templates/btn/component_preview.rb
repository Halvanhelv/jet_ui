# frozen_string_literal: true

# @label Btn
class JetUi::Btn::ComponentPreview < ViewComponent::Preview
  # @label Default
  def default
    render JetUi::Btn::Component.new { "Button" }
  end

  # @label Outline
  def outline
    render JetUi::Btn::Component.new(variant: :outline) { "Outline" }
  end

  # @label Secondary
  def secondary
    render JetUi::Btn::Component.new(variant: :secondary) { "Secondary" }
  end

  # @label Danger
  def danger
    render JetUi::Btn::Component.new(variant: :danger) { "Danger" }
  end

  # @label Ghost
  def ghost
    render JetUi::Btn::Component.new(variant: :ghost) { "Ghost" }
  end

  # @label Link
  def link_variant
    render JetUi::Btn::Component.new(variant: :link) { "Link" }
  end

  # @label As link (url)
  def as_link
    render JetUi::Btn::Component.new(url: "#") { "Link Button" }
  end
end
