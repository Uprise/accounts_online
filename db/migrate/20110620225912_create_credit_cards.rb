class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.integer :application_form_id
      t.string :name
      t.string :account_1
      t.string :account_2
      t.string :account_3
      t.string :account_4

      t.timestamps
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
