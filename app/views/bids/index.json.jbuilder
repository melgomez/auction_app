json.array!(@bids) do |bid|
  json.extract! bid, :id, :item_id, :user_id, :current_bid
  json.url bid_url(bid, format: :json)
end
