class AddEnNameToUser < ActiveRecord::Migration

  def self.up
    add_column(:users, "name_in_english", :string)
  end

  def self.down
    remove_column(:users, "name_in_english")
  end
end
