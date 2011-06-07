class CreateApplicationForms < ActiveRecord::Migration
  def self.up
    create_table :application_forms do |t|
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :application_forms
  end
end
