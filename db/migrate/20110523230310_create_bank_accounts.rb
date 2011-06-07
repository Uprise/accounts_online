class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.string :bank
      t.string :branch
      t.string :account
      t.string :suffix
      t.integer :application_form_id
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
