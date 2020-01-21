class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :saler_id, null: false, foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.string :name, null: false
      t.string :item_discription, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.string :size, null: false
      t.string :brand_name
      t.string :quolity, null: false
      t.integer :price, null: false
      t.string :carriage_fee, null: false
      t.integer :prefecture, null: false, default: 0
      t.string :delivery, null: false
      t.string :days, null: false
      t.timestamps
    end
  end
end
