class AddApplicationFormIdToBartercards < ActiveRecord::Migration
  def self.up
    add_column :bartercards, :application_form_id, :integer
  end

  def self.down
    remove_column :bartercards, :application_form_id
  end
end
