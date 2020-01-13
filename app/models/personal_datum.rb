class PersonalDatum < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :kana_first_name, :kana_last_name, 
            :birthday_year, :birthday_month, :birthday_day, :phone_number, presence: true
  belongs_to :user
end
