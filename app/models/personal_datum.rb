class PersonalDatum < ApplicationRecord
  validates :first_name, :last_name, :kana_first_name, :kana_last_name, 
            :birthday_year, :birthday_month, :birthday_day, :phone_number, presence: true
  
  validates :first_name,            presence: true, length: {maximum: 20}
  validates :last_name,             presence: true, length: {maximum: 20}
  validates :kana_first_name,       presence: true, length: {maximum: 20}
  validates :kana_last_name,        presence: true, length: {maximum: 20}
  validates :birthday_year,         presence: true
  validates :birthday_month,        presence: true
  validates :birthday_day,          presence: true
  validates :phone_number,          length: {maximum: 20}
  
  belongs_to :user, optional: true
end
