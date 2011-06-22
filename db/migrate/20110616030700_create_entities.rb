class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities do |t|
      t.integer :user_id
      t.string  :legal_name
      t.string  :trading_name
      t.string  :industry
      t.string  :gst_number_1
      t.string  :gst_number_2
      t.string  :gst_number_3

      t.timestamps
    end
  end

  def self.down
    drop_table :entities
  end
end
