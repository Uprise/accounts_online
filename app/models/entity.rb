class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :application_forms
  attr_accessible :legal_name, :trading_name, :industry, :gst_number_1, :gst_number_2, :gst_number_3, :abn_number, :country
                  
  validates :legal_name,            :presence     =>  true
  validates :trading_name,          :presence     =>  true
  validates :industry,              :presence     =>  true
  validates :country,               :presence     =>  true,
                                    :inclusion    =>  { :in => %w( AUSTRALIA NEW_ZEALAND ) }
  validates :gst_number_1,          :length       =>  { :is => 3, :if => Proc.new { |a| a.country == 'NEW_ZEALAND' } }
  validates :gst_number_2,          :length       =>  { :is => 3, :if => Proc.new { |a| a.country == 'NEW_ZEALAND' } }
  validates :gst_number_3,          :length       =>  { :is => 3, :if => Proc.new { |a| a.country == 'NEW_ZEALAND' } }
  validates :abn_number,            :length       =>  { :is => 11, :if => Proc.new { |a| a.country == 'AUSTRALIA' } }
                                                        
  def gst_number
    "#{self.gst_number_1}#{self.gst_number_2}#{self.gst_number_3}"
  end
  
  def australian?
    self.country == 'AUSTRALIA'
  end
  
  def kiwi?
    self.country == 'NEW_ZEALAND'
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
#  gst_number_1 :string(255)
#  gst_number_2 :string(255)
#  gst_number_3 :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  country      :string(255)
#  abn_number   :string(255)
#

