module TurboPower
  class RenderHelper
    extend ActionView::Helpers::TagHelper
    extend TurboPower::StreamHelper

    def self.turbo_stream_action_tag(action, target: nil, targets: nil, template: nil, **attributes)
      template = action.to_sym.in?(%i[ remove refresh ]) ? "" : tag.template(template.to_s.html_safe)

      if target = convert_to_turbo_stream_dom_id(target)
        tag.turbo_stream(template, **attributes, action: action, target: target)
      elsif targets = convert_to_turbo_stream_dom_id(targets, include_selector: true)
        tag.turbo_stream(template, **attributes, action: action, targets: targets)
      else
        tag.turbo_stream(template, **attributes, action: action)
      end
    end

    private

    def self.convert_to_turbo_stream_dom_id(target, include_selector: false)
      if Array(target).any? { |value| value.respond_to?(:to_key) }
        "#{"#" if include_selector}#{ActionView::RecordIdentifier.dom_id(*target)}"
      else
        target
      end
    end
  end
end
