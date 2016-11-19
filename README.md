# Localizable

In Redmine when you add roles, issue statuses, enumerations, ... you can only add them in one language, this plugin overloads this limitation.

This plugin allows to define customizable locales in any language for these items:

- Roles.
- Trackers (issues types).
- Issue statuses.
- Custom fields.
- Enumerations.

Once installed, go to Administration, Extensions and click on Configuration link on this plugin.

## Installation notes

Steps:

1. Download last version from: https://github.com/centosadmin/localizable.git
2. Copy plugin directory into #{RAILS_ROOT}/plugins.
3. Run the following command in #{RAILS_ROOT} to upgrade your database: `bundle exec rake redmine:plugins:migrate NAME=localizable RAILS_ENV=production`
4. Restart Redmine.

Original: http://www.redmine.org/plugins/localizable
