class AddAssociateToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :associate, :boolean
    add_column :users, :associate_id, :integer
  end

  def self.down
    remove_column :users, :associate_id
    remove_column :users, :associate
  end
end
