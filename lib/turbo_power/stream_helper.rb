# frozen_string_literal: true

module TurboPower
  module StreamHelper
    include ::TurboPower::AttributeTransformations

    # Custom Action Helpers

    ## Also see:
    ## => https://github.com/hotwired/turbo-rails/pull/374

    def custom_action(name, target: nil, content: nil, attributes: {})
      turbo_stream_action_tag name, target: target, template: content, **transform_attributes(attributes)
    end

    def custom_action_all(name, targets: nil, content: nil, attributes: {})
      turbo_stream_action_tag name, targets: targets, template: content, **transform_attributes(attributes)
    end

    # DOM Actions

    def graft(target, parent, **attributes)
      custom_action_all :graft, targets: target, attributes: attributes.merge(parent: parent)
    end

    def inner_html(target, html = nil, **attributes, &block)
      custom_action_all :inner_html, targets: target, content: html, attributes: attributes, &block
    end

    def insert_adjacent_html(target, html = nil, position: "beforeend", **attributes, &block)
      custom_action_all :insert_adjacent_html, targets: target, content: html, attributes: attributes.merge(position: position), &block
    end

    def insert_adjacent_text(target, text, position: "beforebegin", **attributes)
      custom_action_all :insert_adjacent_text, targets: target, content: "", attributes: attributes.merge(text: text, position: position)
    end

    def morph(target, html = nil, **attributes, &block)
      custom_action_all :morph, targets: target, content: html, attributes: attributes, &block
    end

    def outer_html(target, html = nil, **attributes, &block)
      custom_action_all :outer_html, targets: target, content: html, attributes: attributes, &block
    end

    def text_content(target, text, **attributes)
      custom_action_all :text_content, targets: target, attributes: attributes.merge(text: text)
    end

    def set_meta(name, content, **attributes)
      custom_action :set_meta, attributes: attributes.merge(name: name, content: content)
    end

    # Attribute Actions

    def add_css_class(target, classes, **attributes)
      custom_action_all :add_css_class, targets: target, attributes: attributes.merge(classes: classes)
    end

    def remove_attribute(target, attribute, **attributes)
      custom_action_all :remove_attribute, targets: target, attributes: attributes.merge(attribute: attribute)
    end

    def remove_css_class(target, classes, **attributes)
      custom_action_all :remove_css_class, targets: target, attributes: attributes.merge(classes: classes)
    end

    def set_attribute(target, attribute, value, **attributes)
      custom_action_all :set_attribute, targets: target, attributes: attributes.merge(attribute: attribute, value: value)
    end

    def set_dataset_attribute(target, attribute, value, **attributes)
      custom_action_all :set_dataset_attribute, targets: target, attributes: attributes.merge(attribute: attribute, value: value)
    end

    def set_property(target, name, value, **attributes)
      custom_action_all :set_property, targets: target, attributes: attributes.merge(name: name, value: value)
    end

    def set_style(target, name, value, **attributes)
      custom_action_all :set_style, targets: target, attributes: attributes.merge(name: name, value: value)
    end

    def set_styles(target, styles, **attributes)
      custom_action_all :set_styles, targets: target, attributes: attributes.merge(styles: styles)
    end

    def set_value(target, value, **attributes)
      custom_action_all :set_value, targets: target, attributes: attributes.merge(value: value)
    end

    # Event Actions

    def dispatch_event(target, name, detail: {}, **attributes)
      custom_action_all :dispatch_event, targets: target, attributes: attributes.merge(name: name), content: detail.to_json
    end

    # Form Actions

    def reset_form(target, **attributes)
      custom_action_all :reset_form, targets: target, attributes: attributes
    end

    # Storage Actions

    def clear_storage(type, **attributes)
      custom_action :clear_storage, attributes: attributes.merge(type: type)
    end

    def clear_local_storage(**attributes)
      clear_storage("local", **attributes)
    end

    def clear_session_storage(**attributes)
      clear_storage("session", **attributes)
    end

    def remove_storage_item(key, type, **attributes)
      custom_action :remove_storage_item, attributes: attributes.merge(key: key, type: type)
    end

    def remove_local_storage_item(key, **attributes)
      remove_storage_item(key, "local", **attributes)
    end

    def remove_session_storage_item(key, **attributes)
      remove_storage_item(key, "session", **attributes)
    end

    def set_storage_item(key, value, type, **attributes)
      custom_action :set_storage_item, attributes: attributes.merge(key: key, type: type, value: value)
    end

    def set_local_storage_item(key, value, **attributes)
      set_storage_item(key, value, "local", **attributes)
    end

    def set_session_storage_item(key, value, **attributes)
      set_storage_item(key, value, "session", **attributes)
    end

    # Browser Actions

    def reload(**attributes)
      custom_action :reload, attributes: attributes
    end

    def scroll_into_view(target, inline = "nearest", **attributes)
      custom_action_all :scroll_into_view, targets: target, attributes: attributes.merge(inline: inline)
    end

    def set_cookie(cookie, **attributes)
      custom_action :set_cookie, attributes: attributes.merge(cookie: cookie)
    end

    def set_cookie_item(key = nil, value = nil, **attributes)
      custom_action :set_cookie_item, attributes: { key: key, value: value }.merge(attributes)
    end

    def set_focus(target, **attributes)
      custom_action_all :set_focus, targets: target, attributes: attributes
    end

    def set_title(title, **attributes)
      custom_action :set_title, attributes: attributes.merge(title: title)
    end

    # Browser History Actions

    def history_go(delta, **attributes)
      custom_action :history_go, attributes: attributes.merge(delta: delta)
    end

    def push_state(url, title = nil, state = nil, **attributes)
      custom_action :push_state, attributes: attributes.merge(url: url, title: title, state: state)
    end

    def replace_state(url, title = nil, state = nil, **attributes)
      custom_action :replace_state, attributes: attributes.merge(url: url, title: title, state: state)
    end

    # Debug Actions

    def console_log(message = nil, level = :log, **attributes)
      custom_action :console_log, attributes: attributes.reverse_merge(message: message, level: level)
    end

    def console_table(data, columns, **attributes)
      custom_action :console_table, attributes: attributes.merge(data: data, columns: columns)
    end

    # Notification Actions

    def notification(title = nil, **attributes)
      custom_action :notification, attributes: { title: title }.merge(attributes)
    end

    # Turbo Actions

    def redirect_to(url = nil, turbo_action = "advance", **attributes)
      custom_action :redirect_to, attributes: { url: url, turbo_action: turbo_action }.merge(attributes)
    end

    def turbo_clear_cache(**attributes)
      custom_action :turbo_clear_cache, attributes: attributes
    end

    # Turbo Progress Bar Actions

    def turbo_progress_bar_show(**attributes)
      custom_action :turbo_progress_bar_show, attributes: attributes
    end

    def turbo_progress_bar_hide(**attributes)
      custom_action :turbo_progress_bar_hide, attributes: attributes
    end

    def turbo_progress_bar_set_value(value, **attributes)
      custom_action :turbo_progress_bar_set_value, attributes: attributes.merge(value: value)
    end

    # Turbo Frame Actions

    def turbo_frame_reload(frame_id, **attributes)
      custom_action :turbo_frame_reload, target: frame_id, attributes: attributes
    end

    def turbo_frame_set_src(frame_id, src, **attributes)
      custom_action :turbo_frame_set_src, target: frame_id, attributes: attributes.merge(src: src)
    end
  end
end
