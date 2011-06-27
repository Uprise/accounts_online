class RenameTypeColumnOnApplicationForms < ActiveRecord::Migration
  def self.up
    rename_column :application_forms, :type, :form_type
  end

  def self.down
    rename_column :application_forms, :form_type, :type
  end
end
