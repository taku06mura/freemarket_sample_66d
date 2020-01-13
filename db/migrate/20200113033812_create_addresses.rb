class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :prefecture,        null: false
      t.integer :postal_code,       null: false
      t.string :municipality,       null: false, index: true
      t.string :address,            null: false
      t.string :building_name       
      t.integer :user_id,           null: false, index: true
      t.timestamps
    end
  end
end
