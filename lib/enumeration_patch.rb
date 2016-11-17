# encoding: UTF-8

# Copyright © Emilio González Montaña
# Licence: Attribution & no derivates
#   * Attribution to the plugin web page URL should be done if you want to use it.
#     https://redmine.ociotec.com/projects/localizable
#   * No derivates of this plugin (or partial) are allowed.
# Take a look to licence.txt file at plugin root folder for further details.

require_dependency "enumeration"
require "localizable"

module EnumerationPatch
  def self.included(base)
    base.class_eval do

      def name(original = false)
        return(original ? super() : Localizable.localize("enumeration", id, super()))
      end

    end
  end
end
