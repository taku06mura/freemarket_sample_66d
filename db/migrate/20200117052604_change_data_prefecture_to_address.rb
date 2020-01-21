class ChangeDataPrefectureToAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :prefecture, :integer,  null: false, default: 0
  end
end
