# Contributing to JetUI development

Thank you for considering contributing to JetUI! This document outlines some guidelines for contributing to this open source project.

There are several ways you can contribute to the betterment of the project:

- **Report an issue?** - If the issue isn't reported, we can't fix it. Please report any bugs, feature, and/or improvement requests on the [JetUI GitHub Issues tracker](https://github.com/jetrockets/jet_ui/issues).
- **Submit patches** - Do you have a new feature or a fix you'd like to share? [Submit a pull request](https://github.com/jetrockets/jet_ui/pulls)!
- **Improve documentation** - Help others get started by improving docs, usage examples, or component previews.

## Issues

If you encounter any issues with the project, please check the [existing issues](https://github.com/jetrockets/jet_ui/issues) first to see if the issue has already been reported. If it hasn't, please open a new issue with a clear description of the problem and steps to reproduce it.

## Pull Requests

Please keep the following guidelines in mind when opening a pull request:

- Ensure that your code passes the test suite by running `bundle exec rake test`.
- Run the linter with `bundle exec rubocop` and fix any offenses.
- Provide a clear and detailed description of your changes.
- Keep your changes focused on a single concern.
- Write clean and readable code that follows the project's code style.
- Write clear and concise commit messages.
- Add tests for your changes, if possible.
- Ensure that your changes don't break existing functionality.

New components should align with the design system at [ui.jetrockets.com](https://ui.jetrockets.com).

## Development

JetUI is a ViewComponent-based UI library for Rails. You should have Ruby >= 3.0 and Rails >= 7.0 installed. Run `bundle install` in the root directory to install all dependencies.

1. Fork the project repository.
2. Create a new branch for your contribution.
3. Write your code or make the desired changes.
4. **Ensure that your code passes the test suite by running `bundle exec rake test`.**
5. Commit your changes and push them to your forked repository.
6. [Open a pull request](https://github.com/jetrockets/jet_ui/pulls) to the main project repository with a detailed description of your changes.

## License

JetUI is released under the [MIT License](LICENSE.md). By contributing to this project, you agree to license your contributions under the same license.
