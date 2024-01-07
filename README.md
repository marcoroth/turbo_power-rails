<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/hero-dark.png">
    <img src="assets/hero.png" height="340px">
  </picture>
</p>

<h1 align="center">TurboPower for Rails</h1>

<p align="center">
  <a href="https://github.com/marcoroth/turbo_power">
    <img src="https://github.com/marcoroth/turbo_power-rails/actions/workflows/tests.yml/badge.svg">
  </a>
  <a href="https://rubygems.org/gems/turbo_power">
    <img alt="GEM Version" src="https://img.shields.io/gem/v/turbo_power?color=38C160&logo=ruby&logoColor=FE1616">
  </a>
  <a href="https://rubygems.org/gems/turbo_power">
    <img alt="Gem Downloads" src="https://img.shields.io/gem/dt/turbo_power?color=38C160&logo=ruby&logoColor=FE1616">
  </a>
</p>

## Getting Started

TurboPower Rails is a power-pack for Turbo Streams. This gem provides server-side Ruby helpers for the NPM package [`turbo_power`](https://github.com/marcoroth/turbo_power).

## Important Note

This is very much a work in progress right now. This requires the NPM package `@hotwired/turbo >= 7.2.0` or `@hotwired/turbo-rails >= 7.2.0` and the gem `turbo-rails >= 1.3.0`.

**Also:** I can't guarantee that the current API stays that way, there might be even more ways to improve it.


## Installation

Install the gem and add to the application's Gemfile by executing:

```shell
bundle add turbo_power
```

Install the JavaScript package:

```shell
yarn add turbo_power
```

Initialize TurboPower in `application.js`:

```diff
// application.js
import * as Turbo from '@hotwired/turbo'

+import TurboPower from 'turbo_power'
+TurboPower.initialize(Turbo.StreamActions)
```

### Installation on a stock Rails 7 install with importmaps

1. `./bin/importmap pin turbo_power`

2. You'll then have to make sure the following files are modified as such:

**config/importmaps.rb**
```diff
pin "application", preload: true
- pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
+ pin "@hotwired/turbo", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
- pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@7.2.0/dist/turbo.es2017-esm.js"
pin "turbo_power", to: "https://ga.jspm.io/npm:turbo_power@0.1.6/dist/index.js"
```

**app/javascript/application.js**
```diff
- import '@hotwired/turbo-rails'
+ import { Turbo } from '@hotwired/turbo'
import 'controllers'
+ import TurboPower from 'turbo_power'
+ TurboPower.initialize(Turbo.StreamActions)
```

**Note:** These modifications will continue to work when upgrading Turbo via the [turbo-rails](https://github.com/hotwired/turbo-rails) gem. You can [read more](https://github.com/marcoroth/turbo_power-rails/issues/2) for the reasoning behind these adjustments.


## Custom Actions

### DOM Actions

* `turbo_stream.graft(targets, parent, **attributes)`
* [`turbo_stream.morph(targets, html = nil, **attributes, &block)`](https://github.com/marcoroth/turbo-morph)
* `turbo_stream.inner_html(targets, html = nil, **attributes, &block)`
* `turbo_stream.insert_adjacent_html(targets, html = nil, position: 'beforeend', **attributes, &block)`
* `turbo_stream.insert_adjacent_text(targets, text, position: 'beforebegin', **attributes)`
* `turbo_stream.outer_html(targets, html = nil, **attributes, &block)`
* `turbo_stream.text_content(targets, text, **attributes)`
* `turbo_stream.set_meta(name, content, **attributes)`


### Attribute Actions

* `turbo_stream.add_css_class(targets, classes, **attributes)`
* `turbo_stream.remove_attribute(targets, attribute, **attributes)`
* `turbo_stream.remove_css_class(targets, classes, **attributes)`
* `turbo_stream.set_attribute(targets, attribute, value, **attributes)`
* `turbo_stream.set_dataset_attribute(targets, attribute, value, **attributes)`
* `turbo_stream.set_property(targets, name, value, **attributes)`
* `turbo_stream.set_style(targets, name, value, **attributes)`
* `turbo_stream.set_styles(targets, styles, **attributes)`
* `turbo_stream.set_value(targets, value, **attributes)`
* `turbo_stream.toggle_css_class(targets, classes, **attributes)`
* `turbo_stream.replace_css_class(targets, from, to, **attributes)`


### Event Actions

* `turbo_stream.dispatch_event(targets, name, detail: {}, **attributes)`


### Form Actions

* `turbo_stream.reset_form(targets, **attributes)`


### Storage Actions

* `turbo_stream.clear_storage(type, **attributes)`
* `turbo_stream.clear_local_storage(**attributes)`
* `turbo_stream.clear_session_storage(**attributes)`
* `turbo_stream.remove_storage_item(key, type, **attributes)`
* `turbo_stream.remove_local_storage_item(key, **attributes)`
* `turbo_stream.remove_session_storage_item(key, **attributes)`
* `turbo_stream.set_storage_item(key, value, type, **attributes)`
* `turbo_stream.set_local_storage_item(key, value, **attributes)`
* `turbo_stream.set_session_storage_item(key, value, **attributes)`


### Browser Actions

* `turbo_stream.reload(**attributes)`
* `turbo_stream.scroll_into_view(**attributes)`
  * `turbo_stream.scroll_into_view(targets)`
  * `turbo_stream.scroll_into_view(targets, align_to_top)`
  * `turbo_stream.scroll_into_view(targets, behavior:,  block:, inline:)`
* `turbo_stream.set_focus(targets, **attributes)`
* `turbo_stream.set_title(title, **attributes)`


### Document Actions

* `turbo_stream.set_cookie(cookie, **attributes)`
* `turbo_stream.set_cookie_item(key, value, **attributes)`


### Browser History Actions

* `turbo_stream.history_back(**attributes)`
* `turbo_stream.history_forward(**attributes)`
* `turbo_stream.history_go(delta = 0, **attributes)`
* `turbo_stream.push_state(url, title = "", state = {}, **attributes)`
* `turbo_stream.replace_state(url, title = "", state = {}, **attributes)`


### Debug Actions

* `turbo_stream.console_log(message, level = :log, **attributes)`
* `turbo_stream.console_table(data, columns, **attributes)`


### Notification Actions

* `turbo_stream.notification(title, **options)`


### Turbo Actions

* `turbo_stream.redirect_to(url, turbo_action = nil, turbo_frame = nil, **attributes)`
* `turbo_stream.turbo_clear_cache()`


### Turbo Progress Bar Actions

* `turbo_stream.turbo_progress_bar_show(**attributes)`
* `turbo_stream.turbo_progress_bar_hide(**attributes)`
* `turbo_stream.turbo_progress_bar_set_value(value, **attributes)`


### Turbo Frame Actions

* `turbo_stream.turbo_frame_reload(frame_id, **attributes)`
* `turbo_stream.turbo_frame_set_src(frame_id, src, **attributes)`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcoroth/turbo_power-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/marcoroth/turbo_power-rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TurboPower project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/marcoroth/turbo_power-rails/blob/master/CODE_OF_CONDUCT.md).
