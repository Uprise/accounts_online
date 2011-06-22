class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :application_forms
  attr_accessible :legal_name, :trading_name, :industry, :australian?, :kiwi?, :gst_number_1, :gst_number_2, :gst_number_3
                  
  validates :legal_name,            :presence     =>  true
  validates :trading_name,          :presence     =>  true
  validates :industry,              :presence     =>  true
  validates :gst_number_1,          :length       =>  { :is => 3 }
  validates :gst_number_2,          :length       =>  { :is => 3 }
  validates :gst_number_3,          :length       =>  { :is => 3 }
                                                        
  def gst_number
    "#{self.gst_number_1}#{self.gst_number_2}#{self.gst_number_3}"
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
#

