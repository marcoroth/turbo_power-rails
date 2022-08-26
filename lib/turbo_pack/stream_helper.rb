require "turbo-rails"

module TurboPack
  module StreamHelper

    # DOM Mutations

    # def append(target, html = nil, **attributes, &block)
    #   action :append, target, html, attributes: attributes, &block
    # end

    def graft(target, parent, **attributes)
      action :graft, target: target, attributes: attributes.merge(parent: parent)
    end

    def inner_html(target, html = nil, **attributes, &block)
      action :inner_html, target: target, content: html, attributes: attributes, &block
    end

    def insert_adjacent_html(target, html = nil, position: 'beforeend', **attributes, &block)
      action :insert_adjacent_html, target: target, content: html, attributes: attributes.merge(position: position), &block
    end

    def insert_adjacent_text(target, text, position: 'beforebegin', **attributes)
      action :insert_adjacent_text, target: target, attributes: attributes.merge(text: text, position: position)
    end

    def morph(target, html = nil, **attribtues, &block)
      action :morph, target: target, content: html, attributes: attributes, &block
    end

    def outer_html(target, html = nil, **attributes, &block)
      action :outer_html, target: target, content: html, attributes: attributes, &block
    end

    # def remove()
    # end

    # def prepend()
    # end

    # def replace()
    # end

    def text_content(target, text, **attributes)
      action :text_content, target: target, attributes: attributes.merge(text: text)
    end


    # Element Attribute/Property Mutations


    def add_css_class(target, classes, **attributes)
      action :add_css_class, target: target, attributes: attributes.merge(classes: classes)
    end

    def remove_attribute(target, attribute, **attributes)
      action :remove_attribute, target: target, attributes: attributes.merge(attribute: attribute)
    end

    def remove_css_class(target, classes, **attributes)
      action :remove_css_class, target: target, attributes: attributes.merge(classes: classes)
    end

    def set_attribute(target, attribute, **attributes)
      action :set_attribute, target: target, attributes: attributes.merge(attribute: attribute)
    end

    def set_dataset_attribute(target, attribute, **attributes)
      action :set_dataset_attribute, target, attributes: attributes.merge(attribute: attribute)
    end
    alias :set_dataset_property :set_dataset_attribute

    def set_property(target, property, **attributes)
      action :set_property, target: target, attributes: attributes.merge(property: property)
    end

    def set_style(target, style, **attributes)
      action :set_property, target: target, attributes: attributes.merge(style: style)
    end

    # def set_styles()
    # end

    def set_value(target, value, **attributes)
      action :set_value, target: target, attribtues: attributes.merge(value: value)
    end


    # DOM Events

    def dispatch_event(target, name, detail: {}, **attributes)
      action :dispatch_event, target: target, attributes: attributes.merge(detail: detail)
    end

    def set_meta(name, content)
      action :set_meta, attributes: attributes.merge(name: name, content: content)
    end


    # LocalStorage / SessionStorage

    def clear_storage(type, **attributes)
      action :clear_storage, attributes: attributes.merge(type: type)
    end

    def clear_local_storage(**attributes)
      clear_storage("local", **attributes)
    end

    def clear_session_storage(**attributes)
      clear_storage("sesion", **attributes)
    end


    def remove_storage_item(key, type, **attributes)
      action :remove_storage_item, attributes: attributes.merge(key: key, type: type)
    end

    def remove_local_storage_item(key, **attributes)
      remove_storage_item(key, "local", **attributes)
    end

    def remove_session_storage_item(key, **attributes)
      remove_storage_item(key, "session", **attributes)
    end


    def set_storage_item(key, value, type, **attributes)
      action :set_storage_item, attributes: attributes.merge(key: key, type: type, value: value)
    end

    def set_local_storage_item(key, value, **attributes)
      set_storage_item(key, value, "local", **attributes)
    end

    def set_session_storage_item(key, value, **attributes)
      set_storage_item(key, value, "session", **attributes)
    end


    # Browser Manipulations

    def redirect_to(url, action_name = nil, **attributes)
      action :redirect_to, attributes: attributes.merge(url: url, action: action_name)
    end

    def reload(**attributes)
      action :relaod, attributes: attributes
    end

    def scroll_into_view(target, inline = "nearest")
      action :relaod, target: target, attributes: attributes.merge(inline: inline)
    end

    def set_cookie(cookie, **attributes)
      action :set_cookie, attributes: attributes.merge(cookie: cookie)
    end

    def set_cookie_item(key, value, **attributes)
      action :set_cookie, attributes: attributes.merge(key: key, value: value)
    end

    def set_focus(target, **attributes)
      action :set_focus, target: target, attributes: attributes
    end


    # Browser History

    def history_go(delta, **attributes)
      action :history_go, attributes: attributes.merge(delta: delta)
    end
    alias :go :history_go

    def push_state(url, title = nil, state = nil, **attributes)
      action :push_state, attributes: attributes.merge(url: url, title: title, state: state)
    end

    def replace_state(url, title = nil, state = nil, **attributes)
      action :replace_state, attributes: attributes.merge(url: url, title: title, state: state)
    end


    # Notifications

    def console_log(message, level: :log)
      action :console_log, attributes: { message: message, level: level }
    end

    def console_table(data, columns, **attributes)
      action :console_table, attributes: attributes.merge(data: data, columns: columns)
    end

    def notification(title, options, **attributes)
      action :notification, attributes: attributes.merge(title: title, options: options)
    end

  end
end

Turbo::Streams::TagBuilder.prepend(TurboPack::StreamHelper)
