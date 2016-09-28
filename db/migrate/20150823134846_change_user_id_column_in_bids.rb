class ChangeUserIdColumnInBids < ActiveRecord::Migration
  def change
    rename_column "bids", "user_id_id", "user_id"
  end
end
