# Stat

A metric display card with label, value, and trend description.

## Examples

```erb
<%# Basic stat %>
<%= jet_ui.stat do %>
  <%= jet_ui.stat_label { "Total Revenue" } %>
  <%= jet_ui.stat_value { "$45,231" } %>
  <%= jet_ui.stat_description { "+20.1% from last month" } %>
<% end %>

<%# With trend variants (auto-renders direction arrow) %>
<%= jet_ui.stat do %>
  <%= jet_ui.stat_label { "Active Users" } %>
  <%= jet_ui.stat_value { "2,350" } %>
  <%= jet_ui.stat_description variant: :success do %>+180 this week<% end %>
<% end %>

<%= jet_ui.stat do %>
  <%= jet_ui.stat_label { "Churn Rate" } %>
  <%= jet_ui.stat_value { "3.2%" } %>
  <%= jet_ui.stat_description variant: :error do %>+0.4% this month<% end %>
<% end %>

<%# Grid layout %>
<div class="grid grid-cols-3 gap-4">
  <%= jet_ui.stat do %>...<% end %>
  <%= jet_ui.stat do %>...<% end %>
  <%= jet_ui.stat do %>...<% end %>
</div>
```

## Subcomponents

| Component                | Element | Description                                                        |
|--------------------------|---------|--------------------------------------------------------------------|
| `jet_ui.stat`            | `div`   | Container                                                          |
| `jet_ui.stat_label`      | `p`     | Metric label (e.g. "Total Revenue")                                |
| `jet_ui.stat_value`      | `p`     | Metric value (e.g. "$45,231")                                      |
| `jet_ui.stat_description`| `p`     | Trend text — renders an SVG arrow icon for non-default variants    |

## Parameters

### Stat::DescriptionComponent

| Parameter   | Type   | Default    | Description                                                                   |
|-------------|--------|------------|-------------------------------------------------------------------------------|
| `variant`   | Symbol | `:default` | `default`, `success`, `warning`, `error`                                      |
| `**options` | Hash   | `{}`       | HTML attributes                                                               |

**Trend icon behavior:**
- `success` → up arrow
- `warning`, `error` → down arrow
- `default` → no icon

### Stat::Component / Stat::LabelComponent / Stat::ValueComponent

No required parameters — accept `**options` passed as HTML attributes.
