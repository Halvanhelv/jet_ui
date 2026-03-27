# frozen_string_literal: true

module JetUiHelper
  def jet_ui
    @jet_ui_builder ||= JetUi::Builder.new(self)
  end
end

module JetUi
  class Builder
    def initialize(view_context)
      @view = view_context
    end

    def method_missing(name, *args, **kwargs, &block)
      component_class = resolve_component(name)
      content = args.shift if args.first.is_a?(String)
      instance = component_class.new(*args, **kwargs)
      content ? @view.render(instance) { content } : @view.render(instance, &block)
    end

    def respond_to_missing?(name, include_private = false)
      resolve_component(name)
      true
    rescue NameError
      super
    end

    private

    def resolve_component(name)
      parts = name.to_s.split("_")
      "JetUi::#{name.to_s.camelize}::Component".safe_constantize ||
        "JetUi::#{parts.first.camelize}::#{parts.drop(1).map(&:camelize).join}Component".constantize
    end
  end
end
