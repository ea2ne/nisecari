class AddReferencesToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_condition_id, :integer, null: false
    add_column :items, :postage_payer_id, :integer, null: false
    add_column :items, :preparation_day_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :item_introduction, :text, null: false
    add_column :items, :brand_id, :integer
  end
end
