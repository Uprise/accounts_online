class AddSentPricedEmailToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :sent_priced_email, :boolean
  end

  def self.down
    remove_column :application_forms, :sent_priced_email
  end
end
