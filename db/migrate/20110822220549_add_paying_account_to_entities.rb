class AddPayingAccountToEntities < ActiveRecord::Migration
  def self.up
    add_column :entities, :paying_account, :integer
  end

  def self.down
    remove_column :entities, :paying_account
  end
end
