class AddLegalNameToApplicationForm < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :legal_name, :string
  end

  def self.down
    remove_column :application_forms, :legal_name
  end
end
