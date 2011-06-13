class AddNotesToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :notes, :string
  end

  def self.down
    remove_column :application_forms, :notes
  end
end
