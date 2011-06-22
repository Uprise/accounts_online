class CreateBartercards < ActiveRecord::Migration
  def self.up
    create_table :bartercards do |t|
      t.string :name
      t.string :account_1
      t.string :account_2
      t.string :account_3
      t.string :account_4

      t.timestamps
    end
  end

  def self.down
    drop_table :bartercards
  end
end
