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

    def graft(targets = nil, parent = nil, **attributes)
      custom_action_all :graft, targets: targets, attributes: attributes.reverse_merge(parent: parent)
    end

    def inner_html(targets = nil, html = nil, **attributes, &block)
      html = attributes[:html] || html

      custom_action_all :inner_html, targets: targets, content: html, attributes: attributes.except(:html), &block
    end

    def insert_adjacent_html(targets = nil, html = nil, position: "beforeend", **attributes, &block)
      html = attributes[:html] || html

      custom_action_all :insert_adjacent_html, targets: targets, content: html, attributes: attributes.merge(position: position).except(:html), &block
    end

    def insert_adjacent_text(targets = nil, text = nil, position: "beforebegin", **attributes)
      custom_action_all :insert_adjacent_text, targets: targets, attributes: attributes.reverse_merge(text: text, position: position)
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

    def add_css_class(targets = nil, classes = "", **attributes)
      classes = attributes[:classes] || classes
      classes = classes.join(" ") if classes.is_a?(Array)

      custom_action_all :add_css_class, targets: targets, attributes: attributes.merge(classes: classes)
    end

    def remove_attribute(targets = nil, attribute = nil, **attributes)
      custom_action_all :remove_attribute, targets: targets, attributes: attributes.reverse_merge(attribute: attribute)
    end

    def remove_css_class(targets = nil, classes = "", **attributes)
      classes = attributes[:classes] || classes
      classes = classes.join(" ") if classes.is_a?(Array)

      custom_action_all :remove_css_class, targets: targets, attributes: attributes.merge(classes: classes)
    end

    def set_attribute(targets = nil, attribute = nil, value = nil, **attributes)
      custom_action_all :set_attribute, targets: targets, attributes: attributes.reverse_merge(attribute: attribute, value: value)
    end

    def set_dataset_attribute(targets = nil, attribute = nil, value = nil, **attributes)
      custom_action_all :set_dataset_attribute, targets: targets, attributes: attributes.reverse_merge(attribute: attribute, value: value)
    end

    def set_property(targets = nil, name = nil, value = nil, **attributes)
      custom_action_all :set_property, targets: targets, attributes: attributes.reverse_merge(name: name, value: value)
    end

    def set_style(targets = nil, name = nil, value = nil, **attributes)
      custom_action_all :set_style, targets: targets, attributes: attributes.reverse_merge(name: name, value: value)
    end

    def set_styles(targets = nil, styles = nil, **attributes)
      styles = attributes[:styles] || styles
      styles = styles.map { |k, v| "#{k}: #{v}" }.join("; ") if styles.is_a?(Hash)

      custom_action_all :set_styles, targets: targets, attributes: attributes.merge(styles: styles)
    end

    def set_value(targets = nil, value = nil, **attributes)
      custom_action_all :set_value, targets: targets, attributes: attributes.reverse_merge(value: value)
    end

    def toggle_css_class(targets = nil, classes = "", **attributes)
      classes = attributes[:classes] || classes
      classes = classes.join(" ") if classes.is_a?(Array)

      custom_action_all :toggle_css_class, targets: targets, attributes: attributes.merge(classes: classes)
    end

    def toggle_attribute(targets = nil, attribute = "", force = "false", **attributes)
      attribute = attributes[:attribute] || attribute
      force = attributes[:force] || force

      custom_action_all :toggle_attribute, targets: targets, attributes: attributes.merge(attribute: attribute, force: force)
    end

    def replace_css_class(targets = nil, from = "", to = "", **attributes)
      from = attributes[:from] || from
      to = attributes[:to] || to

      custom_action_all :replace_css_class, targets: targets, attributes: attributes.merge(from: from, to: to)
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

    def clear_storage(type = nil, **attributes)
      custom_action :clear_storage, attributes: attributes.reverse_merge(type: type)
    end

    def clear_local_storage(**attributes)
      clear_storage("local", **attributes)
    end

    def clear_session_storage(**attributes)
      clear_storage("session", **attributes)
    end

    def remove_storage_item(key = nil, type = nil, **attributes)
      custom_action :remove_storage_item, attributes: attributes.reverse_merge(key: key, type: type)
    end

    def remove_local_storage_item(key = nil, **attributes)
      remove_storage_item(key, "local", **attributes)
    end

    def remove_session_storage_item(key = nil, **attributes)
      remove_storage_item(key, "session", **attributes)
    end

    def set_storage_item(key = nil, value = nil, type = nil, **attributes)
      custom_action :set_storage_item, attributes: attributes.reverse_merge(key: key, type: type, value: value)
    end

    def set_local_storage_item(key = nil, value = nil, **attributes)
      set_storage_item(key, value, "local", **attributes)
    end

    def set_session_storage_item(key = nil, value = nil, **attributes)
      set_storage_item(key, value, "session", **attributes)
    end

    # Browser Actions

    def reload(**attributes)
      custom_action :reload, attributes: attributes
    end

    def scroll_into_view(targets = nil, align_to_top = nil, **attributes)
      custom_action_all :scroll_into_view, targets: targets, attributes: attributes.reverse_merge(align_to_top: align_to_top).compact
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

    def history_back(**attributes)
      custom_action :history_back, attributes: attributes
    end

    def history_forward(**attributes)
      custom_action :history_forward, attributes: attributes
    end

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

    def redirect_to(url = nil, turbo_action = "advance", turbo_frame = nil, **attributes)
      custom_action :redirect_to, attributes: attributes.reverse_merge(url: url, turbo_action: turbo_action, turbo_frame: turbo_frame).compact
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
