# Copyright © Emilio González Montaña
# Licence: Attribution & no derivates
#   * Attribution to the plugin web page URL should be done if you want to use it.
#     https://redmine.ociotec.com/projects/localizable
#   * No derivates of this plugin (or partial) are allowed.
# Take a look to licence.txt file at plugin root folder for further details.

module Localizable
  module UserPatch
    def self.prepended(base)
      base.class_eval do
        safe_attributes 'name_in_english'
      end
    end

    def name(formatter = nil)
      if User.current.language.to_s == 'en' && name_in_english.present?
        name_in_english
      else
        super
      end
    end
  end
end
