class MergeGstNumbers < ActiveRecord::Migration
  def self.up
    add_column :entities, :gst_number, :string
    remove_column :entities, :gst_number_1
    remove_column :entities, :gst_number_2
    remove_column :entities, :gst_number_3
  end

  def self.down
    remove_column :entities, :gst_number
    add_column :entities, :gst_number_1, :string
    add_column :entities, :gst_number_2, :string
    add_column :entities, :gst_number_3, :string
  end
end
