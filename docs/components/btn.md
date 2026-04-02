# Btn

A versatile button supporting multiple variants, sizes, and modifiers.

**Variants:** `default` (default), `outline`, `secondary`, `danger`, `ghost`, `link`
**Sizes:** `xs`, `sm`, `md` (default), `lg`, `icon_xs`, `icon_sm`, `icon_md`, `icon_lg`

## Examples

```erb
<%# Default %>
<%= jet_ui.btn { "Save" } %>

<%# Variants %>
<%= jet_ui.btn variant: :outline do %>Cancel<% end %>
<%= jet_ui.btn variant: :secondary do %>Secondary<% end %>
<%= jet_ui.btn variant: :danger do %>Delete<% end %>
<%= jet_ui.btn variant: :ghost do %>Ghost<% end %>
<%= jet_ui.btn variant: :link do %>Link<% end %>

<%# Render as anchor %>
<%= jet_ui.btn url: root_path do %>Go home<% end %>

<%# Render as form button with HTTP method %>
<%= jet_ui.btn url: user_path(@user), method: :delete, variant: :danger do %>Delete<% end %>

<%# Sizes %>
<%= jet_ui.btn size: :xs do %>XS<% end %>
<%= jet_ui.btn size: :sm do %>SM<% end %>
<%= jet_ui.btn size: :lg do %>LG<% end %>

<%# Icon sizes (square, no padding) %>
<%= jet_ui.btn size: :icon_sm do %>★<% end %>
<%= jet_ui.btn size: :icon_md do %>★<% end %>

<%# Modifiers %>
<%= jet_ui.btn rounded: true do %>Pill<% end %>
<%= jet_ui.btn circle: true, size: :icon_md do %>★<% end %>
<%= jet_ui.btn block: true do %>Full width<% end %>
```

## Parameters

| Parameter   | Type    | Default    | Description                                                        |
|-------------|---------|------------|--------------------------------------------------------------------|
| `variant`   | Symbol  | `:default` | `default`, `outline`, `secondary`, `danger`, `ghost`, `link`       |
| `url`       | String  | `nil`      | Renders an `<a>` tag when set                                      |
| `method`    | Symbol  | `nil`      | HTTP method — uses `button_to` (e.g. `:delete`). Requires `url:`  |
| `size`      | Symbol  | `:md`      | `xs`, `sm`, `md`, `lg`, `icon_xs`, `icon_sm`, `icon_md`, `icon_lg`|
| `rounded`   | Boolean | `false`    | Pill shape                                                         |
| `block`     | Boolean | `false`    | Full-width button                                                  |
| `circle`    | Boolean | `false`    | Circle shape (icon-only)                                           |
| `**options` | Hash    | `{}`       | Passed through as HTML attributes                                  |
