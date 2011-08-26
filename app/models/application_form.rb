class ApplicationForm < ActiveRecord::Base
  after_create :notify_admin, :if => :signup?
  
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

  attr_accessible :contact_person_attributes, :addresses_attributes, :accountant_attributes, :bank_accounts_attributes, :credit_cards_attributes, :bartercard_attributes, :status, :notes, :form_type, :set_up_hours, :set_up_rate, :data_entry_hours, :data_entry_rate, :travel_cost, :sent_priced_email?
  
  validates :contact_person,  :presence     =>  true
  validates :accountant,      :presence     =>  true
  validates :addresses,       :length       =>  { :is => 2 }
  validates :form_type,       :inclusion    =>  { :in => %w( SIGNUP CHANGE_BANKLINK CHANGE_BANK_ACCOUNTS ) }
  validates :status,          :inclusion    =>  { :in => %w( PRICING WAITING INCOMPLETE COMPLETE ) }
  
  validates :set_up_hours,  :presence     =>  true, :if => Proc.new{|a| a.status != "PRICING"}
  validates :set_up_rate,  :presence     =>  true, :if => Proc.new{|a| a.status != "PRICING"}
  validates :data_entry_hours,  :presence     =>  true, :if => Proc.new{|a| a.status != "PRICING"}
  validates :data_entry_rate,  :presence     =>  true, :if => Proc.new{|a| a.status != "PRICING"}
  validates :travel_cost,  :presence     =>  true, :if => Proc.new{|a| a.status != "PRICING"}
  
  def connection_fees
    self.number_of_accounts * 20
  end
  
  def set_up_total
    self.set_up_hours * self.set_up_rate
  end
  
  def data_entry_total
    self.data_entry_hours * self.data_entry_rate
  end
  
  def total_cost
    self.data_entry_total + self.set_up_total + self.travel_cost + self.connection_fees
  end
  
  def accounts
    accounts = self.bartercard.exists? ? [[self.bartercard.name, self.bartercard.account]] : []
    self.bank_accounts.each{|account| accounts << [account.name, account.full]}
    self.credit_cards.each{|card| accounts << [card.name, card.account]}
    return accounts
  end
  
  def number_of_accounts
    self.bank_accounts.count + self.credit_cards.count + (self.bartercard.exists? ? 1 : 0)
  end
  
  def signup?
    self.form_type == "SIGNUP"
  end
  
  def physical
    self.addresses.detect {|i| i.address_type == 'PHYSICAL'}
  end
  
  def postal
    self.addresses.detect {|i| i.address_type == 'POSTAL'}
  end
  
  def not_priced?
    self.set_up_hours.blank? || self.set_up_rate.blank? || self.data_entry_hours.blank? || self.data_entry_rate.blank? || self.travel_cost.blank?
  end
  
  def print_form_type
    case self.form_type
      when "SIGNUP" then "Sign up forms"
      when "CHANGE_BANKLINK" then "Changing Banklink"
      when "CHANGE_BANK_ACCOUNTS" then "Changing bank accounts"
    end
  end
  
  def print_status
    case self.status
      when "PRICING" then "Being priced"
      when "WAITING" then "Waiting to recieve forms"
      when "INCOMPLETE" then "Forms are incomplete"
      when "COMPLETE" then "Forms are completed"
    end
  end
  
  def total_transactions
    self.total_bank_account_transactions + self.total_credit_card_transactions + self.bartercard.total_number_of_transactions
  end
  
  def total_bank_account_transactions
    self.bank_accounts.inject(0) {|sum, acct| acct.number_of_transactions.blank? ? sum : sum + acct.number_of_transactions }
  end
  
  def total_credit_card_transactions
    self.credit_cards.inject(0) {|sum, acct| acct.number_of_transactions.blank? ? sum : sum + acct.number_of_transactions }
  end
  
  def monthly_fee
    case self.total_transactions
      when 0..100 then 43.00
      when 101..200 then 49.00
      when 201..300 then 57.78
      else "POA"
    end
  end
  
  def sorted_bank_accounts
    self.bank_accounts.inject({}) do |result, acct|
      bank = acct.account[0..1]
      result[bank] ? result[bank].push(acct) : result[bank] = [acct]
      result
    end
  end
  
  def send_priced_email
    unless self.sent_priced_email?
      UserMailer.application_form_ready(self).deliver
      self.update_attribute :sent_priced_email, true
    end
  end
  
  private
    def notify_admin
      AdminMailer.pricing_needed(self).deliver
    end
  
end

# == Schema Information
#
# Table name: application_forms
#
#  id                :integer         not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  notes             :string(255)
#  status            :string(255)
#  entity_id         :integer
#  form_type         :string(255)
#  set_up_hours      :decimal(, )
#  set_up_rate       :decimal(, )
#  data_entry_hours  :decimal(, )
#  data_entry_rate   :decimal(, )
#  travel_cost       :decimal(, )
#  sent_priced_email :boolean
#

