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

Run:

```bash
bundle install
```

Import the component stylesheets in your application CSS (after your Tailwind import):

```css
@import "jet_ui/btn";
@import "jet_ui/card";
```

Or import everything at once:

```css
@import "jet_ui";
```

## Components

### BtnComponent

A versatile button supporting multiple variants, sizes, and modifiers.

**Variants:** `primary`, `secondary`, `danger`, `ghost`, `link`
**Sizes:** `xs`, `sm`, `md` (default), `lg`, `xl`

```erb
<%# Default button %>
<%= render JetUi::BtnComponent.new do %>
  Button
<% end %>

<%# Primary variant %>
<%= render JetUi::BtnComponent.new(variant: :primary) do %>
  Save
<% end %>

<%# Render as a link (anchor tag) %>
<%= render JetUi::BtnComponent.new(variant: :secondary, href: root_path) do %>
  Go home
<% end %>

<%# Outlined modifier %>
<%= render JetUi::BtnComponent.new(variant: :danger, outlined: true) do %>
  Delete
<% end %>

<%# Size and shape modifiers %>
<%= render JetUi::BtnComponent.new(variant: :primary, size: :lg, rounded: true) do %>
  Large Rounded
<% end %>

<%# Full-width block button %>
<%= render JetUi::BtnComponent.new(variant: :primary, block: true) do %>
  Submit
<% end %>
```

**Parameters**

| Parameter  | Type    | Default | Description                                      |
|------------|---------|---------|--------------------------------------------------|
| `variant`  | Symbol  | `nil`   | Color/style variant: primary, secondary, danger, ghost, link |
| `href`     | String  | `nil`   | Renders an `<a>` tag when set                    |
| `size`     | Symbol  | `:md`   | Size: xs, sm, md, lg, xl                         |
| `rounded`  | Boolean | `false` | Full rounded pill shape                          |
| `block`    | Boolean | `false` | Full-width button                                |
| `circle`   | Boolean | `false` | Circle button (icon-only)                        |
| `outlined` | Boolean | `false` | Outlined/ghost variant of the chosen color       |
| `**options`| Hash    | `{}`    | Passed through as HTML attributes                |

---

### CardComponent

A card container with optional header, body, and footer slots.

```erb
<%# Card with all sections %>
<%= render JetUi::CardComponent.new do |card| %>
  <% card.with_header(title: "My Card", subtitle: "A description") %>
  <% card.with_body do %>
    Card body content.
  <% end %>
  <% card.with_footer do %>
    <%= render JetUi::BtnComponent.new(variant: :primary) { "Save" } %>
  <% end %>
<% end %>

<%# Minimal card (body only) %>
<%= render JetUi::CardComponent.new do |card| %>
  <% card.with_body { "Simple content." } %>
<% end %>
```

#### Card::HeaderComponent

Rendered via `card.with_header(...)`.

| Parameter  | Type    | Default | Description                                     |
|------------|---------|---------|-------------------------------------------------|
| `title`    | String  | `nil`   | Bold heading rendered as `<strong>`             |
| `subtitle` | String  | `nil`   | Secondary text rendered as `<span>`             |
| `align`    | Symbol  | `:left` | Alignment: :left, :center, :right               |
| `bordered` | Boolean | `true`  | Shows a bottom border below the header          |

#### Card::FooterComponent

Rendered via `card.with_footer(...)`.

| Parameter  | Type    | Default  | Description                                    |
|------------|---------|----------|------------------------------------------------|
| `align`    | Symbol  | `:right` | Alignment: :left, :center, :right              |
| `bordered` | Boolean | `true`   | Shows a top border above the footer            |

---

## Generators

Copy a component's source files into your application for local customisation:

```bash
rails generate jet_ui:btn
rails generate jet_ui:card
```

Each generator copies the Ruby component, ERB template (where applicable), CSS stylesheet, RSpec spec, and ViewComponent preview into your application.

## Development

```bash
bundle install
bundle exec rspec
```

## License

MIT
