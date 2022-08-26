require "turbo-rails"

module TurboPower
  module StreamHelper

    # DOM Actions

    def graft(target, parent, **attributes)
      action_all :graft, targets: target, attributes: attributes.merge(parent: parent)
    end

    def inner_html(target, html = nil, **attributes, &block)
      action_all :inner_html, targets: target, content: html, attributes: attributes, &block
    end

    def insert_adjacent_html(target, html = nil, position: 'beforeend', **attributes, &block)
      action_all :insert_adjacent_html, targets: target, content: html, attributes: attributes.merge(position: position), &block
    end

    def insert_adjacent_text(target, text, position: 'beforebegin', **attributes)
      action_all :insert_adjacent_text, targets: target, content: "", attributes: attributes.merge(text: text, position: position)
    end

    def morph(target, html = nil, **attribtues, &block)
      action_all :morph, targets: target, content: html, attributes: attributes, &block
    end

    def outer_html(target, html = nil, **attributes, &block)
      action_all :outer_html, targets: target, content: html, attributes: attributes, &block
    end

    def text_content(target, text, **attributes)
      action_all :text_content, targets: target, attributes: attributes.merge(text: text)
    end

    def set_meta(name, content)
      action :set_meta, attributes: attributes.merge(name: name, content: content)
    end

    # Attribute Actions

    def add_css_class(target, classes, **attributes)
      action_all :add_css_class, targets: target, attributes: attributes.merge(classes: classes)
    end

    def remove_attribute(target, attribute, **attributes)
      action_all :remove_attribute, targets: target, attributes: attributes.merge(attribute: attribute)
    end

    def remove_css_class(target, classes, **attributes)
      action_all :remove_css_class, targets: target, attributes: attributes.merge(classes: classes)
    end

    def set_attribute(target, attribute, value, **attributes)
      action_all :set_attribute, targets: target, attributes: attributes.merge(attribute: attribute, value: value)
    end

    def set_dataset_attribute(target, attribute, value, **attributes)
      action_all :set_dataset_attribute, targets: target, attributes: attributes.merge(attribute: attribute, value: value)
    end

    def set_property(target, property, value, **attributes)
      action_all :set_property, targets: target, attributes: attributes.merge(property: property, value: value)
    end

    def set_style(target, name, value, **attributes)
      action_all :set_style, targets: target, attributes: attributes.merge(name: name, value: value)
    end

    def set_styles(target, styles, **attributes)
      action_all :set_styles, targets: target, attributes: attributes.merge(styles: styles)
    end

    def set_value(target, value, **attributes)
      action_all :set_value, targets: target, attribtues: attributes.merge(value: value)
    end


    # Event Actions

    def dispatch_event(target, name, detail: {}, **attributes)
      action_all :dispatch_event, targets: target, attributes: attributes.merge(detail: detail)
    end


    # Storage Actions

    def clear_storage(type, **attributes)
      action :clear_storage, attributes: attributes.merge(type: type)
    end

    def clear_local_storage(**attributes)
      clear_storage("local", **attributes)
    end

    def clear_session_storage(**attributes)
      clear_storage("session", **attributes)
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


    # Browser Actions

    def redirect_to(url, action_name = nil, **attributes)
      action :redirect_to, attributes: attributes.merge(url: url, action: action_name)
    end

    def reload(**attributes)
      action :reload, attributes: attributes
    end

    def scroll_into_view(target, inline = "nearest")
      action_all :scroll_into_view, targets: target, attributes: attributes.merge(inline: inline)
    end

    def set_cookie(cookie, **attributes)
      action :set_cookie, attributes: attributes.merge(cookie: cookie)
    end

    def set_cookie_item(key, value, **attributes)
      action :set_cookie_item, attributes: attributes.merge(key: key, value: value)
    end

    def set_focus(target, **attributes)
      action_all :set_focus, targets: target, attributes: attributes
    end


    # Browser History Actions

    def history_go(delta, **attributes)
      action :history_go, attributes: attributes.merge(delta: delta)
    end

    def push_state(url, title = nil, state = nil, **attributes)
      action :push_state, attributes: attributes.merge(url: url, title: title, state: state)
    end

    def replace_state(url, title = nil, state = nil, **attributes)
      action :replace_state, attributes: attributes.merge(url: url, title: title, state: state)
    end


    # Debug Actions

    def console_log(message, level: :log)
      action :console_log, attributes: { message: message, level: level }
    end

    def console_table(data, columns, **attributes)
      action :console_table, attributes: attributes.merge(data: data, columns: columns)
    end

    # Notification Actions

    def notification(title, options, **attributes)
      action :notification, attributes: attributes.merge(title: title, options: options)
    end

  end
end

Turbo::Streams::TagBuilder.prepend(TurboPower::StreamHelper)
