class BankAccount < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :bank, :branch, :account, :suffix, :needs_cheques, :pays_subscription?, :number_of_transactions
  
  validates :name,      :presence     =>  true
  validates :account,   :length       =>  { :is => 16 }
                        
  def bank
    read_attribute(:bank) || ""
  end
  
  def branch
    read_attribute(:branch) || ""
  end
  
  def account
    read_attribute(:account) || ""
  end
  
  def suffix
    read_attribute(:suffix) || ""
  end
  
  def full
    "#{self.bank}#{self.branch}#{self.account}#{self.suffix}"
  end
  
end


# == Schema Information
#
# Table name: bank_accounts
#
#  id                     :integer         not null, primary key
#  bank                   :string(255)
#  branch                 :string(255)
#  account                :string(255)
#  suffix                 :string(255)
#  application_form_id    :integer
#  order                  :integer
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  needs_cheques          :boolean
#  pays_subscription      :boolean
#  number_of_transactions :integer
#

