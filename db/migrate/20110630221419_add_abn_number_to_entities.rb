class AddAbnNumberToEntities < ActiveRecord::Migration
  def self.up
    add_column :entities, :abn_number, :string
  end

  def self.down
    remove_column :entities, :abn_number
  end
end
