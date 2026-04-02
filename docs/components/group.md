# Group

Groups buttons together, collapsing their shared borders into a single line.

## Examples

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

## Parameters

| Parameter   | Type    | Default | Description                    |
|-------------|---------|---------|--------------------------------|
| `sticky`    | Boolean | `true`  | Merges adjacent button borders |
| `**options` | Hash    | `{}`    | HTML attributes                |
