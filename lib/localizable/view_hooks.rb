module Localizable
  class ViewHooks < Redmine::Hook::ViewListener
    def view_my_account(context={})
      return '' unless context[:form] && context[:user]
      "<p>#{context[:form].text_field :name_in_english, autocomplete: 'none'}</p>".html_safe
    end

    def view_users_form(context={})
      return '' unless context[:form] && context[:user]
      "<p>#{context[:form].text_field :name_in_english, autocomplete: 'none'}</p>".html_safe
    end
  end
end
