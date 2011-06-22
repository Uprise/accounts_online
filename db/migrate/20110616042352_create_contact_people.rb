class CreateContactPeople < ActiveRecord::Migration
  def self.up
    create_table :contact_people do |t|
      t.string :business_phone
      t.string :toll_free_phone
      t.string :facsimile
      t.string :home_phone
      t.string :mobile_phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_people
  end
end
