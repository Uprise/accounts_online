class AddNameToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :name, :string
  end

  def self.down
    remove_column :bank_accounts, :name
  end
end
