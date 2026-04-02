# Badge

A small label for status, categories, or counts.

**Variants:** `default` (default), `info`, `success`, `warning`, `error`
**Sizes:** `xs`, `sm` (default), `md`, `lg`

## Examples

```erb
<%= jet_ui.badge { "New" } %>
<%= jet_ui.badge variant: :info do %>Info<% end %>
<%= jet_ui.badge variant: :success do %>Active<% end %>
<%= jet_ui.badge variant: :warning do %>Pending<% end %>
<%= jet_ui.badge variant: :error do %>Failed<% end %>

<%# Sizes %>
<%= jet_ui.badge size: :xs do %>XS<% end %>
<%= jet_ui.badge size: :md do %>MD<% end %>
<%= jet_ui.badge size: :lg do %>LG<% end %>

<%# Pill shape %>
<%= jet_ui.badge variant: :info, rounded: true do %>Beta<% end %>
```

## Parameters

| Parameter   | Type    | Default    | Description                                      |
|-------------|---------|------------|--------------------------------------------------|
| `variant`   | Symbol  | `:default` | `default`, `info`, `success`, `warning`, `error` |
| `size`      | Symbol  | `:sm`      | `xs`, `sm`, `md`, `lg`                           |
| `rounded`   | Boolean | `false`    | Pill shape                                       |
| `**options` | Hash    | `{}`       | HTML attributes                                  |
