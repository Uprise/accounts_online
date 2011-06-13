class AddStatusToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :status, :string
  end

  def self.down
    remove_column :application_forms, :status
  end
end
