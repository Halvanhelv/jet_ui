# Card

A card container with standalone subcomponents for each section.

## Examples

```erb
<%# Minimal card %>
<%= jet_ui.card do %>
  <%= jet_ui.card_body do %>Simple content.<% end %>
<% end %>

<%# Card with header %>
<%= jet_ui.card do %>
  <%= jet_ui.card_header do %>
    <%= jet_ui.card_title "My Card" %>
    <%= jet_ui.card_subtitle "A description" %>
  <% end %>
  <%= jet_ui.card_body do %>Card body content.<% end %>
<% end %>

<%# Full card with footer %>
<%= jet_ui.card do %>
  <%= jet_ui.card_header do %>
    <%= jet_ui.card_title "Full Card" %>
    <%= jet_ui.card_subtitle "With all sections" %>
  <% end %>
  <%= jet_ui.card_body do %>Main content.<% end %>
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
  <%= jet_ui.card_body do %>...<% end %>
<% end %>

<%# Without borders %>
<%= jet_ui.card do %>
  <%= jet_ui.card_header bordered: false do %>
    <%= jet_ui.card_title "No border" %>
  <% end %>
  <%= jet_ui.card_body do %>Content.<% end %>
  <%= jet_ui.card_footer bordered: false do %>Footer.<% end %>
<% end %>
```

## Parameters

### Card::Component

| Parameter   | Type | Default | Description                    |
|-------------|------|---------|--------------------------------|
| `**options` | Hash | `{}`    | HTML attributes on `.card` div |

### Card::HeaderComponent

| Parameter   | Type    | Default  | Description                                              |
|-------------|---------|----------|----------------------------------------------------------|
| `direction` | Symbol  | `:col`   | Flex direction: `:col`, `:row`                           |
| `align`     | Symbol  | `:start` | Align items: `:start`, `:center`, `:end`                 |
| `justify`   | Symbol  | `:start` | Justify content: `:start`, `:center`, `:end`, `:between` |
| `bordered`  | Boolean | `true`   | Bottom border                                            |
| `**options` | Hash    | `{}`     | HTML attributes                                          |

### Card::FooterComponent

| Parameter   | Type    | Default  | Description                                              |
|-------------|---------|----------|----------------------------------------------------------|
| `direction` | Symbol  | `:row`   | Flex direction: `:col`, `:row`                           |
| `align`     | Symbol  | `:start` | Align items: `:start`, `:center`, `:end`                 |
| `justify`   | Symbol  | `:start` | Justify content: `:start`, `:center`, `:end`, `:between` |
| `bordered`  | Boolean | `true`   | Top border                                               |
| `**options` | Hash    | `{}`     | HTML attributes                                          |

### Card::BodyComponent / Card::TitleComponent / Card::SubtitleComponent

No required parameters — accept `**options` passed as HTML attributes.
