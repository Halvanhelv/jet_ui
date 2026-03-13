# frozen_string_literal: true

# @label Btn
class JetUi::BtnComponentPreview < ViewComponent::Preview
  def default
    render JetUi::BtnComponent.new do
      "Button"
    end
  end

  def primary
    render JetUi::BtnComponent.new(variant: :primary) do
      "Primary"
    end
  end

  def secondary
    render JetUi::BtnComponent.new(variant: :secondary) do
      "Secondary"
    end
  end

  def danger
    render JetUi::BtnComponent.new(variant: :danger) do
      "Danger"
    end
  end

  def ghost
    render JetUi::BtnComponent.new(variant: :ghost) do
      "Ghost"
    end
  end

  def link_variant
    render JetUi::BtnComponent.new(variant: :link) do
      "Link"
    end
  end
end
