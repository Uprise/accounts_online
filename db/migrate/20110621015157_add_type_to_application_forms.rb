class AddTypeToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :type, :string
  end

  def self.down
    remove_column :application_forms, :type
  end
end
