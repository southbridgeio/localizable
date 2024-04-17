module Localizable
  class ViewHooks < Redmine::Hook::ViewListener
    def view_my_account(context={})
      <<-SRC
        <p>#{context[:form].text_field :name_in_english, :value => context[:user].name_in_english}</p>
      SRC
    end

    def view_users_form(context={})
      <<-SRC
        <p>#{context[:form].text_field :name_in_english, :value => context[:user].name_in_english}</p>
      SRC
    end
  end
end
