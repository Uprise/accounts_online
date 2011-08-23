class MergeBankAccountFields < ActiveRecord::Migration
  def self.up
    remove_column :bank_accounts, :banks
    remove_column :bank_accounts, :branch
    remove_column :bank_accounts, :suffix
  end

  def self.down
    add_column :bank_accounts, :bank, :string
    add_column :bank_accounts, :branch, :string
    add_column :bank_accounts, :suffix, :string
  end
end
