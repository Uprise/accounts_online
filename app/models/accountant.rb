class Accountant < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :address_1, :address_2, :partner, :phone, :email
  
  validates :name,       :presence     =>  true
  validates :address_1,  :presence     =>  true
  validates :address_2,  :presence     =>  true
  validates :partner,    :presence     =>  true
  validates :phone,      :presence     =>  true
  validates :email,      :presence     =>  true
end


# == Schema Information
#
# Table name: accountants
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  address_1           :string(255)
#  address_2           :string(255)
#  partner             :string(255)
#  phone               :string(255)
#  email               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  application_form_id :integer
#

