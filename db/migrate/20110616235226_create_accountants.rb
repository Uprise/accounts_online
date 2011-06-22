class CreateAccountants < ActiveRecord::Migration
  def self.up
    create_table :accountants do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :partner
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :accountants
  end
end
