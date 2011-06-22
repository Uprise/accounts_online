class AddApplicationFormIdToAccountants < ActiveRecord::Migration
  def self.up
    add_column :accountants, :application_form_id, :integer
  end

  def self.down
    remove_column :accountants, :application_form_id
  end
end
