# Copyright © Emilio González Montaña
# Licence: Attribution & no derivates
#   * Attribution to the plugin web page URL should be done if you want to use it.
#     https://redmine.ociotec.com/projects/localizable
#   * No derivates of this plugin (or partial) are allowed.
# Take a look to licence.txt file at plugin root folder for further details.

require "redmine"

require File.expand_path('lib/localizable', __dir__)
require File.expand_path('lib/localizable/view_hooks', __dir__)

Rails.configuration.to_prepare do
  require_relative 'lib/localizable/user_patch'
  require_relative 'lib/localizable/role_patch'
  require_relative 'lib/localizable/tracker_patch'
  require_relative 'lib/localizable/issue_status_patch'
  require_relative 'lib/localizable/custom_field_patch'
  require_relative 'lib/localizable/enumeration_patch'
end

Rails.application.config.after_initialize do
  User.prepend(Localizable::UserPatch) unless User.ancestors.include?(Localizable::UserPatch)
  Role.prepend(Localizable::RolePatch) unless Role.ancestors.include?(Localizable::RolePatch)
  Tracker.prepend(Localizable::TrackerPatch) unless Tracker.ancestors.include?(Localizable::TrackerPatch)
  IssueStatus.prepend(Localizable::IssueStatusPatch) unless IssueStatus.ancestors.include?(Localizable::IssueStatusPatch)
  CustomField.prepend(Localizable::CustomFieldPatch) unless CustomField.ancestors.include?(Localizable::CustomFieldPatch)
  Enumeration.prepend(Localizable::EnumerationPatch) unless Enumeration.ancestors.include?(Localizable::EnumerationPatch)
end

Redmine::Plugin.register :localizable do
  name "Localizable plugin"
  url "https://redmine.ociotec.com/projects/localizable"
  author "Emilio González Montaña | SouthBridge"
  author_url "http://ociotec.com"
  description "This is a plugin for Redmine that is used to show strings (issue types, issue statuses, enumerations, ...) in serveral languages"
  version "1.0.0"
  requires_redmine :version_or_higher => "2.1.0"

  settings(:default => {"default_language" => "en",
                        "locales_to_translate" => [],
                        "locales" => {"tracker" => {},
                                      "issue_status" => {}}},
           :partial => "settings/localizable")
end
