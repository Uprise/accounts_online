class CreditCard < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :account, :number_of_transactions
  
  validates :name,       :presence     =>  { :unless => Proc.new { |a| a.account.blank? } }
  validates :account,    :length       =>  { :is     => 16 }
  
end


# == Schema Information
#
# Table name: credit_cards
#
#  id                     :integer         not null, primary key
#  application_form_id    :integer
#  name                   :string(255)
#  account_1              :string(255)
#  account_2              :string(255)
#  account_3              :string(255)
#  account_4              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  number_of_transactions :integer
#

