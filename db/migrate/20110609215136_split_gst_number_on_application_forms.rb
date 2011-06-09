class SplitGstNumberOnApplicationForms < ActiveRecord::Migration
  def self.up
    rename_column :application_forms, :gst_number, :gst_number_1
    add_column    :application_forms, :gst_number_2, :string
    add_column    :application_forms, :gst_number_3, :string
  end

  def self.down
    remove_column    :application_forms, :gst_number_2
    remove_column    :application_forms, :gst_number_3
    rename_column :application_forms, :gst_number_1, :gst_number
  end
end
