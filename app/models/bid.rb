class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  
  scope :highest_bid, -> { order("current_bid DESC") }
end
