class CreatePersonalData < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_data do |t|
      t.string :first_name,      null: false
      t.string :last_name,       null: false
      t.string :kana_first_name, null: false, index: true
      t.string :kana_last_name,  null: false, index: true
      t.integer :birthday_year,  null: false, index: true
      t.integer :birthday_month, null: false, index: true
      t.integer :birthday_day,   null: false, index: true
      t.integer :phone_number,   null: false, index: true
      t.integer :user_id,        null: false, index: true
      t.timestamps
    end
  end
end
