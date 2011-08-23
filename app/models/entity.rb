class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :application_forms
  attr_accessible :legal_name, :trading_name, :industry, :gst_number, :abn_number, :country, :paying_account
                  
  validates :legal_name,            :presence     =>  true
  validates :trading_name,          :presence     =>  true
  validates :industry,              :presence     =>  true
  validates :country,               :presence     =>  true,
                                    :inclusion    =>  { :in => %w( AUSTRALIA NEW_ZEALAND ) }
  validates :gst_number,            :length       =>  { :is => 9, :if => Proc.new { |a| a.country == 'NEW_ZEALAND' } }
  validates :abn_number,            :length       =>  { :is => 11, :if => Proc.new { |a| a.country == 'AUSTRALIA' } }
  
  def australian?
    self.country == 'AUSTRALIA'
  end
  
  def kiwi?
    self.country == 'NEW_ZEALAND'
  end
  
  def signed_up?
    self.sign_up_forms.select{|forms| forms.status == "COMPLETE" }.count > 0
  end
  
  def signing_up?
    self.sign_up_forms.select{|forms| forms.status != "COMPLETE" }.count > 0
  end
  
  def has_been_priced?
    self.sign_up_forms.select{|forms| forms.status != "PRICING" }.count > 0
  end
  
  def sign_up_forms
    self.application_forms.select{|forms| forms.form_type == "SIGNUP" }
  end
  
  def recent_sign_up_form
    self.sign_up_forms.last
  end
  
end


# == Schema Information
#
# Table name: entities
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  legal_name   :string(255)
#  trading_name :string(255)
#  industry     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  country      :string(255)
#  abn_number   :string(255)
#  gst_number   :string(255)
#

