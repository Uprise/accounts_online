class AddApplicationFormIdToContactPeople < ActiveRecord::Migration
  def self.up
    add_column :contact_people, :application_form_id, :integer
  end

  def self.down
    remove_column :contact_people, :application_form_id
  end
end
