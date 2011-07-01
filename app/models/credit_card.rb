class CreditCard < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :account_1, :account_2, :account_3, :account_4, :number_of_transactions
  
  validates :name,       :presence     =>  { :unless => Proc.new { |a| a.account_1.blank? } }
  validates :account_1,    :length       =>  { :is     => 4  }
  validates :account_2,    :length       =>  { :is     => 4  }
  validates :account_3,    :length       =>  { :is     => 4  }
  validates :account_4,    :length       =>  { :is     => 4  }
  
  def account
    "#{self.account_1}#{self.account_2}#{self.account_3}#{self.account_4}"
  end
  
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

