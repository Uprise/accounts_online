class Address < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :address_1, :address_2, :address_3, :postcode, :address_type
  
  validates :address_1,    :presence     =>  true
  validates :address_2,    :presence     =>  true
  validates :address_3,    :presence     =>  true
  validates :postcode,     :presence     =>  true
  validates :address_type, :presence     =>  true
end


# == Schema Information
#
# Table name: addresses
#
#  id                  :integer         not null, primary key
#  application_form_id :integer
#  address_type        :string(255)
#  address_1           :string(255)
#  address_2           :string(255)
#  address_3           :string(255)
#  postcode            :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

