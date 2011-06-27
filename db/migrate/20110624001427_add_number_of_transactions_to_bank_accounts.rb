class AddNumberOfTransactionsToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :number_of_transactions, :integer
  end

  def self.down
    remove_column :bank_accounts, :number_of_transactions
  end
end
