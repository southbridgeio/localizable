class AddEnNameToUser < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]

  def self.up
    add_column(:users, "name_in_english", :string)
  end

  def self.down
    remove_column(:users, "name_in_english")
  end
end
