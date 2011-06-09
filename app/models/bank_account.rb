class BankAccount < ActiveRecord::Base
  belongs_to :application_form
  attr_accessible :name, :bank, :branch, :account, :suffix, :needs_cheques, :pays_subscription?
  
  validates :name,      :presence     =>  true
  validates :bank,      :presence     =>  true,
                        :length       =>  { :is => 2 }
  validates :branch,    :presence     =>  true,
                        :length       =>  { :is => 4 }
  validates :account,   :presence     =>  true,
                        :length       =>  { :is => 7 }
  validates :suffix,    :presence     =>  true,
                        :length       =>  { :is => 3 }
                        
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
end
