class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :starting_bid
      t.datetime :auction_end

      t.timestamps null: false
    end
  end
end
