# frozen_string_literal: true

module TurboStreamHelpers
  class ViewContext
    private

    def view_methods
      ActionView::Base.instance_methods - Object.instance_methods
    end

    def method_missing(name, *params, &block)
      view_methods.include?(name) ? nil : super
    end

    def respond_to_missing?(name, *_params, &_block)
      view_methods.include?(name)
    end
  end

  def view_context
    ViewContext.new
  end

  def turbo_stream
    Turbo::Streams::TagBuilder.new(view_context)
  end
end
