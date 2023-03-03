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

    def inner_html(targets = nil, html = nil, **attributes, &block)
      html = attributes[:html] || html

      custom_action_all :inner_html, targets: targets, content: html, attributes: attributes.except(:html), &block
    end

    def insert_adjacent_html(target, html = nil, position: "beforeend", **attributes, &block)
      custom_action_all :insert_adjacent_html, targets: target, content: html, attributes: attributes.merge(position: position), &block
    end

    def insert_adjacent_text(target, text, position: "beforebegin", **attributes)
      custom_action_all :insert_adjacent_text, targets: target, content: "", attributes: attributes.merge(text: text, position: position)
    end

    def morph(targets = nil, html = nil, **attributes, &block)
      html = attributes[:html] || html

      custom_action_all :morph, targets: targets, content: html, attributes: attributes.except(:html), &block
    end

    def outer_html(targets = nil, html = nil, **attributes, &block)
      html = attributes[:html] || html

      custom_action_all :outer_html, targets: targets, content: html, attributes: attributes.except(:html), &block
    end

    def text_content(targets = nil, text = nil, **attributes)
      custom_action_all :text_content, targets: targets, attributes: attributes.reverse_merge(text: text)
    end

    def set_meta(name = nil, content = nil, **attributes)
      custom_action :set_meta, attributes: attributes.reverse_merge(name: name, content: content)
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

    def set_value(targets = nil, value = nil, **attributes)
      custom_action_all :set_value, targets: targets, attributes: attributes.reverse_merge(value: value)
    end

    # Event Actions

    def dispatch_event(targets = nil, name = nil, detail: {}, **attributes)
      custom_action_all :dispatch_event, targets: targets, content: detail.to_json, attributes: attributes.reverse_merge(name: name)
    end

    # Form Actions

    def reset_form(targets = nil, **attributes)
      custom_action_all :reset_form, targets: targets, attributes: attributes
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

    def scroll_into_view(targets = nil, **attributes)
      custom_action_all :scroll_into_view, targets: targets, attributes: attributes
    end

    def set_cookie(cookie = nil, **attributes)
      custom_action :set_cookie, attributes: attributes.reverse_merge(cookie: cookie)
    end

    def set_cookie_item(key = nil, value = nil, **attributes)
      custom_action :set_cookie_item, attributes: attributes.reverse_merge(key: key, value: value)
    end

    def set_focus(targets = nil, **attributes)
      custom_action_all :set_focus, targets: targets, attributes: attributes
    end

    def set_title(title = nil, **attributes)
      custom_action :set_title, attributes: attributes.reverse_merge(title: title)
    end

    # Browser History Actions

    def history_go(delta = 0, **attributes)
      custom_action :history_go, attributes: attributes.reverse_merge(delta: delta)
    end

    def push_state(url = nil, title = "", state = {}, **attributes)
      custom_action :push_state, attributes: attributes.reverse_merge(url: url, title: title, state: state)
    end

    def replace_state(url = nil, title = "", state = {}, **attributes)
      custom_action :replace_state, attributes: attributes.reverse_merge(url: url, title: title, state: state)
    end

    # Debug Actions

    def console_log(message = nil, level = :log, **attributes)
      custom_action :console_log, attributes: attributes.reverse_merge(message: message, level: level)
    end

    def console_table(data = [], columns = [], **attributes)
      custom_action :console_table, attributes: attributes.reverse_merge(data: data, columns: columns)
    end

    # Notification Actions

    def notification(title = nil, **attributes)
      custom_action :notification, attributes: attributes.reverse_merge(title: title)
    end

    # Turbo Actions

    def redirect_to(url = nil, turbo_action = "advance", **attributes)
      custom_action :redirect_to, attributes: attributes.reverse_merge(url: url, turbo_action: turbo_action)
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

    def turbo_progress_bar_set_value(value = nil, **attributes)
      custom_action :turbo_progress_bar_set_value, attributes: attributes.reverse_merge(value: value)
    end

    # Turbo Frame Actions

    def turbo_frame_reload(target = nil, **attributes)
      custom_action :turbo_frame_reload, target: target, attributes: attributes
    end

    def turbo_frame_set_src(target = nil, src = nil, **attributes)
      custom_action :turbo_frame_set_src, target: target, attributes: attributes.reverse_merge(src: src)
    end
  end
end
