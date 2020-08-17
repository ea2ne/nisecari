class AddIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :seller_id, :string, null: false
    add_column :items, :buyer_id, :string
  end
end
