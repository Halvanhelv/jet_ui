# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-03-13

### Added
- Initial gem structure with `JetUi::Engine`
- `JetUi::BtnComponent` — button component with variants (primary, secondary, danger, ghost, link), sizes (xs, sm, md, lg, xl), and modifiers (rounded, block, circle, outlined, href)
- `JetUi::CardComponent` — card container with `header`, `body`, and `footer` slots
- `JetUi::Card::HeaderComponent` — card header with title, subtitle, alignment, and border options
- `JetUi::Card::FooterComponent` — card footer with alignment and border options
- CSS stylesheets for btn and card components (Tailwind CSS `@layer components`)
- ViewComponent previews for both components
- RSpec tests for both components
- Rails generators: `rails generate jet_ui:btn` and `rails generate jet_ui:card`
