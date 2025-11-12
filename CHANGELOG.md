# Localizable Changes

1.0.0
----------

This is a Localizable plugin of version "0.4.0" updated with SouthBridge.

Compatibility: Redmine 6.1 / Rails 7.2 / Ruby 3.3

Redmine 6.1 compatibility:
- fix view hooks logic for `name_in_english` field

Rails 7 autoloading compatibility:
- Removed deprecated `require_dependency` calls
- Replaced with `require_relative` inside `Rails.configuration.to_prepare` block
- Removed `ActiveSupport::Dependencies` manipulation code

Modern Ruby/Rails patterns:
- Refactored from include + alias_method pattern to prepend
- Changed patch application to `after_initialize` for proper loading
- Updated all model patches (Role, Tracker, IssueStatus, CustomField, Enumeration, User)
- Removed unnecessary # encoding: UTF-8 comments (UTF-8 is default in Ruby 3.3)

Testing:
- Plugin tested with Redmine 6.1.0-stable, Rails 7.2.2.2, Ruby 3.3.10

0.4.0
----------
Basic version of "Localizable plugin"
- https://redmine.ociotec.com/projects/localizable
