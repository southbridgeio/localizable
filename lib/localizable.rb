# encoding: UTF-8

# Copyright © Emilio González Montaña
# Licence: Attribution & no derivates
#   * Attribution to the plugin web page URL should be done if you want to use it.
#     https://redmine.ociotec.com/projects/localizable
#   * No derivates of this plugin (or partial) are allowed.
# Take a look to licence.txt file at plugin root folder for further details.

module Localizable

  def self.localize(type, id, name)
    value = name
    unless Setting["plugin_localizable"].nil?
      unless Setting["plugin_localizable"]["locales"].nil?
        unless Setting["plugin_localizable"]["locales"][type].nil?
          unless Setting["plugin_localizable"]["locales"][type][id.to_s].nil?
            unless Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s].blank?
              value = Setting["plugin_localizable"]["locales"][type][id.to_s][User.current.language.to_s]
            end
          end
        end
      end
    end
    return(value)
  end

end
