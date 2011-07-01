class AddNumberrOfTransactionsToBartercards < ActiveRecord::Migration
  def self.up
    add_column :bartercards, :number_of_transactions, :integer
  end

  def self.down
    remove_column :bartercards, :number_of_transactions
  end
end
