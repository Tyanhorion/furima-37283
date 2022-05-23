class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :explanation
      t.integer :price
      t.integer :delivery_id
      t.integer :prefecture_id
      t.references :user
      t.integer :category_id
      t.integer :situation_id
      t.integer :shipping_day_id

      t.timestamps
    end
  end
end
