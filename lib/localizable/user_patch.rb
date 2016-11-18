# encoding: UTF-8

# Copyright © Emilio González Montaña
# Licence: Attribution & no derivates
#   * Attribution to the plugin web page URL should be done if you want to use it.
#     https://redmine.ociotec.com/projects/localizable
#   * No derivates of this plugin (or partial) are allowed.
# Take a look to licence.txt file at plugin root folder for further details.

module Localizable
  module UserPatch
    def self.included(base)
      base.send(:include, InstanceMethods)

      base.class_eval do
        # Same as typing in the class.
        unloadable # Send unloadable so it will not be unloaded in development.
        safe_attributes 'name_in_english'

        alias_method_chain :name, :localizable
      end
    end
  end
  module InstanceMethods
    def name_with_localizable(formatter = nil)
      if  User.current.language.to_s == 'en' and name_in_english.present?
        name_in_english
      else
        name_without_localizable(formatter)
      end
    end
  end
end
