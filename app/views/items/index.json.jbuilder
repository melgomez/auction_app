json.array!(@items) do |item|
  json.extract! item, :id, :name, :starting_bid, :auction_end
  json.url item_url(item, format: :json)
end
