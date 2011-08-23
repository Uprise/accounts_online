class Bartercard < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :account, :number_of_transactions
                  
  validates :name,       :presence     =>  { :unless => Proc.new { |a| a.account.blank? } }
  validates :account,    :length       =>  { :is     => 16, :unless => Proc.new { |a| a.name.blank? }  }
  
  def total_number_of_transactions
    self.number_of_transactions * 3 # Each bartercard transaction counts as 3 seperate transactions in banklink
  end
  
  def exists?
    self.account.present? && self.name.present?
  end
  
end




# == Schema Information
#
# Table name: bartercards
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  account_1              :string(255)
#  account_2              :string(255)
#  account_3              :string(255)
#  account_4              :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  application_form_id    :integer
#  number_of_transactions :integer
#

