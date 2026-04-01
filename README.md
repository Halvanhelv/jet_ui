# JetUi

ViewComponent-based UI library for Rails applications, matching the design system at [ui.jetrockets.com](https://ui.jetrockets.com).

## Requirements

- Ruby >= 3.1
- Rails >= 7.0
- [ViewComponent](https://viewcomponent.org) >= 3.0
- Tailwind CSS v4 (configured in your host app)

## Installation

Add to your Gemfile:

```ruby
gem "jet_ui"
```

Run the install generator:

```bash
bundle install
rails generate jet_ui:install
```

The generator injects a single import into your Tailwind CSS source file:

```css
@import "/path/to/gem/app/assets/stylesheets/jet_ui.css";
```

This single file imports all component stylesheets automatically. When the gem is updated with new components, your app picks them up on the next CSS build — no manual changes needed.

## Usage

The `jet_ui` helper is available in all views and gives you access to every component via a concise builder syntax:

```erb
<%= jet_ui.btn { "Save" } %>
<%= jet_ui.card do %>...</% end %>
```

Subcomponents follow the `namespace_subcomponent` naming convention:

```erb
<%= jet_ui.card_header do %>...</% end %>
<%= jet_ui.alert_title { "Error" } %>
<%= jet_ui.stat_label { "Revenue" } %>
```

---

## Components

### Btn

A versatile button supporting multiple variants, sizes, and modifiers.

**Variants:** `default` (default), `outline`, `secondary`, `danger`, `ghost`, `link`
**Sizes:** `xs`, `sm`, `md` (default), `lg`, `icon_xs`, `icon_sm`, `icon_md`, `icon_lg`

```erb
<%# Default button %>
<%= jet_ui.btn { "Save" } %>

<%# Variants %>
<%= jet_ui.btn variant: :outline do %>Cancel<% end %>
<%= jet_ui.btn variant: :danger do %>Delete<% end %>
<%= jet_ui.btn variant: :ghost do %>Ghost<% end %>
<%= jet_ui.btn variant: :link do %>Link<% end %>

<%# Render as anchor %>
<%= jet_ui.btn url: root_path do %>Go home<% end %>

<%# Sizes %>
<%= jet_ui.btn size: :sm do %>Small<% end %>
<%= jet_ui.btn size: :icon_md do %>★<% end %>

<%# Modifiers %>
<%= jet_ui.btn rounded: true do %>Pill<% end %>
<%= jet_ui.btn circle: true, size: :icon_md do %>★<% end %>
<%= jet_ui.btn block: true do %>Full width<% end %>
```

| Parameter  | Type    | Default    | Description                                                   |
|------------|---------|------------|---------------------------------------------------------------|
| `variant`  | Symbol  | `:default` | `default`, `outline`, `secondary`, `danger`, `ghost`, `link`  |
| `url`      | String  | `nil`      | Renders an `<a>` tag when set                                 |
| `size`     | Symbol  | `:md`      | `xs`, `sm`, `md`, `lg`, `icon_xs`, `icon_sm`, `icon_md`, `icon_lg` |
| `rounded`  | Boolean | `false`    | Pill shape                                                    |
| `block`    | Boolean | `false`    | Full-width button                                             |
| `circle`   | Boolean | `false`    | Circle shape (icon-only)                                      |
| `method`   | Symbol  | `nil`      | HTTP method for `button_to` (e.g. `:delete`)                  |
| `**options`| Hash    | `{}`       | Passed through as HTML attributes                             |

---

### Card

A card container with standalone subcomponents for each section.

```erb
<%# Full card %>
<%= jet_ui.card do %>
  <%= jet_ui.card_header do %>
    <%= jet_ui.card_title "My Card" %>
    <%= jet_ui.card_subtitle "A description" %>
  <% end %>
  <%= jet_ui.card_body do %>
    Card body content.
  <% end %>
  <%= jet_ui.card_footer justify: :end do %>
    <%= jet_ui.btn variant: :outline do %>Cancel<% end %>
    <%= jet_ui.btn { "Save" } %>
  <% end %>
<% end %>

<%# Header with row direction and space-between %>
<%= jet_ui.card do %>
  <%= jet_ui.card_header direction: :row, justify: :between do %>
    <%= jet_ui.card_title "Users" %>
    <%= jet_ui.btn size: :sm do %>Add user<% end %>
  <% end %>
  <%= jet_ui.card_body do %>...</% end %>
<% end %>
```

#### Card::Component

| Parameter  | Type | Default | Description                   |
|------------|------|---------|-------------------------------|
| `**options`| Hash | `{}`    | HTML attributes on `.card` div |

#### Card::HeaderComponent

| Parameter   | Type    | Default  | Description                                              |
|-------------|---------|----------|----------------------------------------------------------|
| `direction` | Symbol  | `:col`   | Flex direction: `:col`, `:row`                           |
| `align`     | Symbol  | `:start` | Align items: `:start`, `:center`, `:end`                 |
| `justify`   | Symbol  | `:start` | Justify content: `:start`, `:center`, `:end`, `:between` |
| `bordered`  | Boolean | `true`   | Bottom border                                            |

#### Card::FooterComponent

| Parameter   | Type    | Default  | Description                                              |
|-------------|---------|----------|----------------------------------------------------------|
| `direction` | Symbol  | `:row`   | Flex direction: `:col`, `:row`                           |
| `align`     | Symbol  | `:start` | Align items: `:start`, `:center`, `:end`                 |
| `justify`   | Symbol  | `:start` | Justify content: `:start`, `:center`, `:end`, `:between` |
| `bordered`  | Boolean | `true`   | Top border                                               |

#### Card::BodyComponent / Card::TitleComponent / Card::SubtitleComponent

Wrapper components with no required parameters — accept `**options` passed as HTML attributes.

---

### Badge

A small label for status, categories, or counts.

**Variants:** `default` (default), `info`, `success`, `warning`, `error`
**Sizes:** `xs`, `sm` (default), `md`, `lg`

```erb
<%= jet_ui.badge { "New" } %>
<%= jet_ui.badge variant: :success do %>Active<% end %>
<%= jet_ui.badge variant: :error, size: :lg do %>Failed<% end %>
<%= jet_ui.badge variant: :info, rounded: true do %>Beta<% end %>
```

| Parameter  | Type    | Default    | Description                                         |
|------------|---------|------------|-----------------------------------------------------|
| `variant`  | Symbol  | `:default` | `default`, `info`, `success`, `warning`, `error`    |
| `size`     | Symbol  | `:sm`      | `xs`, `sm`, `md`, `lg`                              |
| `rounded`  | Boolean | `false`    | Pill shape                                          |
| `**options`| Hash    | `{}`       | HTML attributes                                     |

---

### Alert

A contextual message block with optional title, description, and icon.

**Variants:** `default` (default), `info`, `success`, `warning`, `error`

```erb
<%# Simple alert %>
<%= jet_ui.alert variant: :info do %>
  <%= jet_ui.alert_title { "Heads up" } %>
  <%= jet_ui.alert_description { "Your session expires in 5 minutes." } %>
<% end %>

<%# Alert with icon %>
<%= jet_ui.alert variant: :success do %>
  <%= jet_ui.alert_icon { "✓" } %>
  <%= jet_ui.alert_description { "Changes saved successfully." } %>
<% end %>
```

| Component              | Element  | Description                                 |
|------------------------|----------|---------------------------------------------|
| `jet_ui.alert`         | `div`    | Container — accepts `variant:` and `**options` |
| `jet_ui.alert_title`   | `strong` | Bold heading                                |
| `jet_ui.alert_description` | `div` | Body text — shifts right when icon present |
| `jet_ui.alert_icon`    | `span`   | Icon slot — triggers two-column grid layout |

---

### Group

Groups buttons together, collapsing their shared border into a single line.

```erb
<%# Sticky (merged borders) — default %>
<%= jet_ui.group do %>
  <%= jet_ui.btn variant: :outline do %>Day<% end %>
  <%= jet_ui.btn variant: :outline do %>Week<% end %>
  <%= jet_ui.btn variant: :outline do %>Month<% end %>
<% end %>

<%# Non-sticky (keeps gap between buttons) %>
<%= jet_ui.group sticky: false do %>
  <%= jet_ui.btn { "Save" } %>
  <%= jet_ui.btn variant: :outline do %>Cancel<% end %>
<% end %>
```

| Parameter  | Type    | Default | Description                             |
|------------|---------|---------|-----------------------------------------|
| `sticky`   | Boolean | `true`  | Merges adjacent button borders          |
| `**options`| Hash    | `{}`    | HTML attributes                         |

---

### Stat

A metric display card with label, value, and trend description.

```erb
<%= jet_ui.stat do %>
  <%= jet_ui.stat_label { "Total Revenue" } %>
  <%= jet_ui.stat_value { "$45,231" } %>
  <%= jet_ui.stat_description variant: :success do %>+20% from last month<% end %>
<% end %>
```

#### Stat::DescriptionComponent

Renders a trend icon (SVG) automatically for non-default variants: up arrow for `success`, down arrow for `warning` and `error`.

| Parameter  | Type   | Default    | Description                                      |
|------------|--------|------------|--------------------------------------------------|
| `variant`  | Symbol | `:default` | `default`, `success`, `warning`, `error`         |
| `**options`| Hash   | `{}`       | HTML attributes                                  |

---

## Eject

Copy a component's source into your application for local customisation:

```bash
rails generate jet_ui:eject btn
rails generate jet_ui:eject card
rails generate jet_ui:eject btn card
```

Ejected files land in `app/components/jet_ui/` and take precedence over the gem's versions automatically.

By default both the test file and the ViewComponent preview are ejected alongside the component. Use the flags below to skip either:

```bash
rails generate jet_ui:eject btn --skip-test
rails generate jet_ui:eject btn --skip-preview
rails generate jet_ui:eject btn --skip-test --skip-preview
```

---

## Development

```bash
bundle install
bundle exec ruby -Itest test/components/jet_ui/btn/component_test.rb
# or run all tests
bundle exec ruby -Itest -e "Dir['test/components/**/*_test.rb'].each { |f| require File.expand_path(f) }"
```

## License

MIT
