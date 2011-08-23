class MergeCreditCardFields < ActiveRecord::Migration
  def self.up
    add_column :credit_cards, :account, :string
    remove_column :credit_cards, :account_1
    remove_column :credit_cards, :account_2
    remove_column :credit_cards, :account_3
    remove_column :credit_cards, :account_4
  end

  def self.down
    remove_column :credit_cards, :account
    add_column :credit_cards, :account_1, :string
    add_column :credit_cards, :account_2, :string
    add_column :credit_cards, :account_3, :string
    add_column :credit_cards, :account_4, :string
  end
end
