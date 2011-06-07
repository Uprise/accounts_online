class AddBartercardToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :bartercard_account, :string
    add_column :application_forms, :bartercard_name, :string
  end

  def self.down
    remove_column :application_forms, :bartercard_name
    remove_column :application_forms, :bartercard_account
  end
end
