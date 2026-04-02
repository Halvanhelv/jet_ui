# Alert

A contextual message block with optional title, description, and icon.

**Variants:** `default` (default), `info`, `success`, `warning`, `error`

## Examples

```erb
<%# Simple alert %>
<%= jet_ui.alert do %>
  <%= jet_ui.alert_title { "Heads up" } %>
  <%= jet_ui.alert_description { "Your session expires in 5 minutes." } %>
<% end %>

<%# With variant %>
<%= jet_ui.alert variant: :success do %>
  <%= jet_ui.alert_title { "Saved" } %>
  <%= jet_ui.alert_description { "Your changes have been saved." } %>
<% end %>

<%# With icon — triggers two-column grid layout %>
<%= jet_ui.alert variant: :info do %>
  <%= jet_ui.alert_icon { "ℹ" } %>
  <%= jet_ui.alert_title { "With Icon" } %>
  <%= jet_ui.alert_description { "The description shifts right when an icon is present." } %>
<% end %>

<%# Description only %>
<%= jet_ui.alert variant: :error do %>
  <%= jet_ui.alert_description { "Something went wrong. Please try again." } %>
<% end %>
```

## Subcomponents

| Component                  | Element  | Description                                          |
|----------------------------|----------|------------------------------------------------------|
| `jet_ui.alert`             | `div`    | Container — accepts `variant:` and `**options`       |
| `jet_ui.alert_title`       | `strong` | Bold heading                                         |
| `jet_ui.alert_description` | `div`    | Body text — shifts right automatically when icon is present |
| `jet_ui.alert_icon`        | `span`   | Icon slot — triggers two-column grid layout          |

## Parameters

### Alert::Component

| Parameter   | Type   | Default    | Description                                      |
|-------------|--------|------------|--------------------------------------------------|
| `variant`   | Symbol | `:default` | `default`, `info`, `success`, `warning`, `error` |
| `**options` | Hash   | `{}`       | HTML attributes                                  |

### Alert::TitleComponent / Alert::DescriptionComponent / Alert::IconComponent

No required parameters — accept `**options` passed as HTML attributes.
