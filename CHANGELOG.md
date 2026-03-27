# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `JetUi::Badge::Component` — badge with variants (default, info, success, warning, error), sizes (xs, sm, md, lg), and rounded modifier
- `JetUi::Alert::Component` — contextual alert with variant support
- `JetUi::Alert::TitleComponent` — bold heading for alerts
- `JetUi::Alert::DescriptionComponent` — body text, shifts right when icon present
- `JetUi::Alert::IconComponent` — icon slot that triggers two-column grid layout
- `JetUi::Group::Component` — button group with sticky border merging
- `JetUi::Stat::Component` — stat card container
- `JetUi::Stat::LabelComponent` — metric label
- `JetUi::Stat::ValueComponent` — metric value
- `JetUi::Stat::DescriptionComponent` — trend description with inline SVG arrow icon
- `app/assets/stylesheets/jet_ui.css` — single entry point that imports all component stylesheets; one `@import` in the host app covers all components including future additions
- CSS stylesheets for badge, alert, group, and stat components
- Full semantic color token system in `theme.css` (accent, muted, destructive, success, warning, info — with soft/border/foreground variants, dark mode via `.dark` class, radius tokens)

### Changed
- **Breaking:** `JetUi::BtnComponent` replaced by `JetUi::Btn::Component`
- **Breaking:** `JetUi::CardComponent` (slot-based) replaced by standalone subcomponents: `Card::Component`, `Card::HeaderComponent`, `Card::FooterComponent`, `Card::BodyComponent`, `Card::TitleComponent`, `Card::SubtitleComponent`
- **Breaking:** Btn variant `primary` renamed to `default`; removed `outlined:` modifier (use `variant: :outline` instead)
- **Breaking:** Btn parameter `href:` renamed to `url:`
- **Breaking:** Btn sizes `xl` removed; icon sizes added: `icon_xs`, `icon_sm`, `icon_md`, `icon_lg`
- Card header/footer layout now controlled via CSS modifier classes (`direction:`, `align:`, `justify:` parameters) instead of raw Tailwind utilities
- `jet_ui:install` generator now injects a single `@import "jet_ui.css"` instead of individual per-component imports
- Eject generator updated to new file structure

### Added (helpers)
- `JetUiHelper` with `jet_ui` builder method available in all views
- `JetUi::Builder` — resolves `jet_ui.btn`, `jet_ui.card_header`, `jet_ui.alert_title`, etc. to their respective component classes

## [0.1.0] - 2026-03-13

### Added
- Initial gem structure with `JetUi::Engine`
- `JetUi::BtnComponent` — button component with variants (primary, secondary, danger, ghost, link), sizes (xs, sm, md, lg, xl), and modifiers (rounded, block, circle, outlined, href)
- `JetUi::CardComponent` — card container with `header`, `body`, and `footer` slots
- `JetUi::Card::HeaderComponent` — card header with title, subtitle, alignment, and border options
- `JetUi::Card::FooterComponent` — card footer with alignment and border options
- CSS stylesheets for btn and card components (Tailwind CSS `@layer components`)
- ViewComponent previews for both components
- Minitest tests for both components
- Rails generators: `rails generate jet_ui:install`, `rails generate jet_ui:eject`
