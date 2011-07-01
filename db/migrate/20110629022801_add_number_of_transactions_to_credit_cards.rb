class AddNumberOfTransactionsToCreditCards < ActiveRecord::Migration
  def self.up
    add_column :credit_cards, :number_of_transactions, :integer
  end

  def self.down
    remove_column :credit_cards, :number_of_transactions
  end
end
