class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.belongs_to :items, index: true
      t.belongs_to :user_id, index: true
      t.integer :current_bid

      t.timestamps null: false
    end
  end
end
