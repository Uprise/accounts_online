class AddNameToContactPeople < ActiveRecord::Migration
  def self.up
    add_column :contact_people, :name, :string
  end

  def self.down
    remove_column :contact_people, :name
  end
end
