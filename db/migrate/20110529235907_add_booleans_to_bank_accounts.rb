class AddBooleansToBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :needs_cheques, :boolean
    add_column :bank_accounts, :pays_subscription, :boolean
  end

  def self.down
    remove_column :bank_accounts, :pays_subscription
    remove_column :bank_accounts, :needs_cheques
  end
end
