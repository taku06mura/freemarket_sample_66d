class PersonalDatum < ApplicationRecord

  # validation
  validates :first_name,            presence: true, length: {maximum: 20}
  validates :last_name,             presence: true, length: {maximum: 20}
  validates :kana_first_name,       presence: true, length: {maximum: 20}
  validates :kana_last_name,        presence: true, length: {maximum: 20}
  validates :birthday_year,         presence: true
  validates :birthday_month,        presence: true
  validates :birthday_day,          presence: true
  validates :phone_number,          presence: true, length: {maximum: 20}
  
  # assosiation
  belongs_to :user, optional: true
end
