class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :item_discription, null: false
      t.integer :category1_id, null: false, foreign_key: true
      t.integer :category2_id, null: false, foreign_key: true
      t.integer :category3_id, null: false, foreign_key: true
      t.string :size, null: false
      t.string :brand_name
      t.string :quality, null: false
      t.integer :price, null: false
      t.string :carriage_fee, null: false
      t.string :prefecture, null: false
      t.string :delivery, null: false
      t.string :days, null: false
      t.timestamps
    end
  end
end
