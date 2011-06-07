class AddManyFieldsToApplicationForms < ActiveRecord::Migration
  def self.up
    add_column :application_forms, :trading_name, :string
    add_column :application_forms, :contact_name, :string
    add_column :application_forms, :physical_address_1, :string
    add_column :application_forms, :physical_address_2, :string
    add_column :application_forms, :physical_address_3, :string
    add_column :application_forms, :physical_postcode, :string
    add_column :application_forms, :postal_address_1, :string
    add_column :application_forms, :postal_address_2, :string
    add_column :application_forms, :postal_address_3, :string
    add_column :application_forms, :postal_postcode, :string
    add_column :application_forms, :industry, :string
    add_column :application_forms, :contact_business, :string
    add_column :application_forms, :contact_toll_free, :string
    add_column :application_forms, :contact_facsimile, :string
    add_column :application_forms, :contact_home, :string
    add_column :application_forms, :contact_mobile, :string
    add_column :application_forms, :contact_email, :string
    add_column :application_forms, :gst_number, :string
    add_column :application_forms, :accountant_name, :string
    add_column :application_forms, :accountant_address_1, :string
    add_column :application_forms, :accountant_address_2, :string
    add_column :application_forms, :accountant_partner, :string
    add_column :application_forms, :accountant_phone, :string
    add_column :application_forms, :accountant_email, :string
  end

  def self.down
    remove_column :application_forms, :accountant_email
    remove_column :application_forms, :accountant_phone
    remove_column :application_forms, :accountant_partner
    remove_column :application_forms, :accountant_address_2
    remove_column :application_forms, :accountant_address_1
    remove_column :application_forms, :accountant_name
    remove_column :application_forms, :gst_number
    remove_column :application_forms, :contact_email
    remove_column :application_forms, :contact_mobile
    remove_column :application_forms, :contact_home
    remove_column :application_forms, :contact_facsimile
    remove_column :application_forms, :contact_toll_free
    remove_column :application_forms, :contact_business
    remove_column :application_forms, :industry
    remove_column :application_forms, :postal_postcode
    remove_column :application_forms, :postal_address_3
    remove_column :application_forms, :postal_address_2
    remove_column :application_forms, :postal_address_1
    remove_column :application_forms, :physical_postcode
    remove_column :application_forms, :physical_address_3
    remove_column :application_forms, :physical_address_2
    remove_column :application_forms, :physical_address_1
    remove_column :application_forms, :contact_name
    remove_column :application_forms, :trading_name
  end
end
