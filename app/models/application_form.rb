class ApplicationForm < ActiveRecord::Base
  belongs_to :user
  has_many :bank_accounts
  accepts_nested_attributes_for :bank_accounts, :allow_destroy => true
  attr_accessible :legal_name, :trading_name, :contact_name, :physical_address_1, :physical_address_2, :physical_address_3, 
                  :physical_postcode, :postal_address_1, :postal_address_2, :postal_address_3, :postal_postcode,
                  :industry, :contact_business, :contact_toll_free, :contact_facsimile, :contact_home, :contact_mobile,
                  :contact_email, :gst_number_1, :gst_number_2, :gst_number_3, :accountant_name, :accountant_address_1, :accountant_address_2, :accountant_partner, 
                  :accountant_phone, :accountant_email, :bank_accounts_attributes, :bartercard_account, :bartercard_name, :status, :notes
                  
  validates :legal_name,            :presence     =>  true
  validates :trading_name,          :presence     =>  true
  validates :contact_name,          :presence     =>  true
  validates :industry,              :presence     =>  true
  validates :gst_number_1,          :length       =>  { :is => 3 }
  validates :gst_number_2,          :length       =>  { :is => 3 }
  validates :gst_number_3,          :length       =>  { :is => 3 }
  
  validates :physical_address_1,    :presence     =>  true
  validates :physical_address_2,    :presence     =>  true
  validates :physical_address_3,    :presence     =>  true
  validates :physical_postcode,     :presence     =>  true
  
  validates :postal_address_1,      :presence     =>  true
  validates :postal_address_2,      :presence     =>  true
  validates :postal_address_3,      :presence     =>  true
  validates :postal_postcode,       :presence     =>  true
  
  validates :contact_business,      :presence     =>  true
  validates :contact_toll_free,     :presence     =>  true
  validates :contact_facsimile,     :presence     =>  true
  validates :contact_home,          :presence     =>  true
  validates :contact_mobile,        :presence     =>  true
  validates :contact_email,         :presence     =>  true
  
  validates :accountant_name,       :presence     =>  true
  validates :accountant_address_1,  :presence     =>  true
  validates :accountant_address_2,  :presence     =>  true
  validates :accountant_partner,    :presence     =>  true
  validates :accountant_phone,      :presence     =>  true
  validates :accountant_email,      :presence     =>  true
   
  validates :bank_accounts,         :length       =>  { :in => 1..3 }
  
  validates :bartercard_name,       :presence     =>  { :unless => Proc.new { |a| a.bartercard_account.blank? } }
  validates :bartercard_account,    :length       =>  { :is     => 16, 
                                                        :unless => Proc.new { |a| a.bartercard_name.blank? }  }
                                                        
  def gst_number
    "#{self.gst_number_1}#{self.gst_number_2}#{self.gst_number_3}"
  end
  
end
