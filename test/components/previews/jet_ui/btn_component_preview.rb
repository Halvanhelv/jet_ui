# frozen_string_literal: true

# @label Btn
class JetUi::BtnComponentPreview < ViewComponent::Preview
  # @label Default (no variant)
  def default
    render JetUi::BtnComponent.new do
      "Button"
    end
  end

  # @label Primary
  def primary
    render JetUi::BtnComponent.new(variant: :primary) do
      "Primary"
    end
  end

  # @label Secondary
  def secondary
    render JetUi::BtnComponent.new(variant: :secondary) do
      "Secondary"
    end
  end

  # @label Danger
  def danger
    render JetUi::BtnComponent.new(variant: :danger) do
      "Danger"
    end
  end

  # @label Ghost
  def ghost
    render JetUi::BtnComponent.new(variant: :ghost) do
      "Ghost"
    end
  end

  # @label Link
  def link_variant
    render JetUi::BtnComponent.new(variant: :link) do
      "Link"
    end
  end

  # @label Outlined Primary
  def outlined_primary
    render JetUi::BtnComponent.new(variant: :primary, outlined: true) do
      "Outlined Primary"
    end
  end

  # @label Outlined Secondary
  def outlined_secondary
    render JetUi::BtnComponent.new(variant: :secondary, outlined: true) do
      "Outlined Secondary"
    end
  end

  # @label Outlined Danger
  def outlined_danger
    render JetUi::BtnComponent.new(variant: :danger, outlined: true) do
      "Outlined Danger"
    end
  end

  # @label Size XS
  def size_xs
    render JetUi::BtnComponent.new(variant: :primary, size: :xs) do
      "Extra Small"
    end
  end

  # @label Size SM
  def size_sm
    render JetUi::BtnComponent.new(variant: :primary, size: :sm) do
      "Small"
    end
  end

  # @label Size MD (default)
  def size_md
    render JetUi::BtnComponent.new(variant: :primary, size: :md) do
      "Medium"
    end
  end

  # @label Size LG
  def size_lg
    render JetUi::BtnComponent.new(variant: :primary, size: :lg) do
      "Large"
    end
  end

  # @label Size XL
  def size_xl
    render JetUi::BtnComponent.new(variant: :primary, size: :xl) do
      "Extra Large"
    end
  end

  # @label Rounded
  def rounded
    render JetUi::BtnComponent.new(variant: :primary, rounded: true) do
      "Rounded"
    end
  end

  # @label Block (full width)
  def block
    render JetUi::BtnComponent.new(variant: :primary, block: true) do
      "Block Button"
    end
  end

  # @label As link (href)
  def as_link
    render JetUi::BtnComponent.new(variant: :primary, href: "#") do
      "Link Button"
    end
  end

  # @label With data attributes
  def with_data_attributes
    render JetUi::BtnComponent.new(
      variant: :danger,
      data: { confirm: "Are you sure?" }
    ) do
      "Delete"
    end
  end
end
