class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                   null: false
      t.integer :price,                 null: false
      t.string :trading_status,         null: false
      t.timestamp :deal_closed_date
      t.timestamps
    end
  end
end
