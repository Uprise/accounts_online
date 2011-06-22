class ApplicationForm < ActiveRecord::Base
  belongs_to :entity
  has_many :bank_accounts
  has_many :credit_cards
  has_many :addresses
  has_one :bartercard
  has_one :contact_person
  has_one :accountant

  accepts_nested_attributes_for :contact_person
  accepts_nested_attributes_for :accountant
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :bank_accounts, :allow_destroy => true
  accepts_nested_attributes_for :credit_cards, :allow_destroy => true
  accepts_nested_attributes_for :bartercard

  attr_accessible :contact_person_attributes, :addresses_attributes, :accountant_attributes, :bank_accounts_attributes, :credit_cards_attributes, :bartercard_attributes, :status, :notes, :type
  
  validates :contact_person,  :presence     =>  true
  validates :accountant,      :presence     =>  true
  validates :bank_accounts,   :length       =>  { :in => 1..3 }
  validates :addresses,       :length       =>  { :is => 2 }
  validates :type,            :inclusion    =>  { :in => %w( SIGNUP CHANGE_BANKLINK CHANGE_BANK_ACCOUNTS ) }
  validates :status,          :inclusion    =>  { :in => %w( WAITING INCOMPLETE COMPLETE ) }
  
  def physical
    self.addresses.detect {|i| i.address_type == 'PHYSICAL'}
  end
  
  def postal
    self.addresses.detect {|i| i.address_type == 'POSTAL'}
  end
  
  def type 
    @type ||= "SIGNUP"
  end
  
  def print_type
    case self.type
      when "SIGNUP" then "Sign up forms"
      when "CHANGE_BANKLINK" then "Changing Banklink"
      when "CHANGE_BANK_ACCOUNTS" then "Changing bank accounts"
    end
  end
  
  def status 
    @status ||= "WAITING"
  end
  
  def print_status
    case self.status
      when "WAITING" then "Waiting to recieve forms"
      when "INCOMPLETE" then "Forms are incomplete"
      when "COMPLETE" then "Forms are completed"
    end
  end
end

# == Schema Information
#
# Table name: application_forms
#
#  id         :integer         not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  notes      :string(255)
#  status     :string(255)
#  entity_id  :integer
#  type       :string(255)
#

