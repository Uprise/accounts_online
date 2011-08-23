class MergeBartercardFields < ActiveRecord::Migration
  def self.up
    add_column :bartercards, :account, :string
    remove_column :bartercards, :account_1
    remove_column :bartercards, :account_2
    remove_column :bartercards, :account_3
    remove_column :bartercards, :account_4
  end

  def self.down
    remove_column :bartercards, :account
    add_column :bartercards, :account_1, :string
    add_column :bartercards, :account_2, :string
    add_column :bartercards, :account_3, :string
    add_column :bartercards, :account_4, :string
  end
end
