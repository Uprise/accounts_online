class AddPricingToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :set_up_hours, :decimal
    add_column :application_forms, :set_up_rate, :decimal
    add_column :application_forms, :data_entry_hours, :decimal
    add_column :application_forms, :data_entry_rate, :decimal
    add_column :application_forms, :travel_cost, :decimal
  end

  def self.down
    remove_column :application_forms, :travel_cost
    remove_column :application_forms, :data_entry_rate
    remove_column :application_forms, :data_entry_hours
    remove_column :application_forms, :set_up_rate
    remove_column :application_forms, :set_up_hours
  end
end
