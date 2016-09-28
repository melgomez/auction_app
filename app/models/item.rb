class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  
  validates_presence_of :user_id
end
