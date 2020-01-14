class ChangeDatatypePhoneNumberOfPersonalData < ActiveRecord::Migration[5.2]
  def change
    change_column :personal_data, :phone_number, :string
  end
end
