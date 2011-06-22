class ContactPerson < ActiveRecord::Base
  belongs_to :application_form
  
  attr_accessible :name, :business_phone, :toll_free_phone, :facsimile, :home_phone, :mobile_phone, :email
  
  validates :name,                :presence     =>  true
  validates :business_phone,      :presence     =>  true
  validates :toll_free_phone,     :presence     =>  true
  validates :facsimile,           :presence     =>  true
  validates :home_phone,          :presence     =>  true
  validates :mobile_phone,        :presence     =>  true
  validates :email,               :presence     =>  true
  
end


# == Schema Information
#
# Table name: contact_people
#
#  id                  :integer         not null, primary key
#  business_phone      :string(255)
#  toll_free_phone     :string(255)
#  facsimile           :string(255)
#  home_phone          :string(255)
#  mobile_phone        :string(255)
#  email               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)
#  application_form_id :integer
#

