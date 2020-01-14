class RenameAddressColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :address, :house_number
  end
end
