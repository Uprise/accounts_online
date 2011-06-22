class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :application_form_id
      t.string :type
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :postcode

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
