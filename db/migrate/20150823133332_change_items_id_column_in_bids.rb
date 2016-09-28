class ChangeItemsIdColumnInBids < ActiveRecord::Migration
  def change
    rename_column "bids", "items_id", "item_id"
  end
end
