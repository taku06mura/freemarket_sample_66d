class PersonalDatum < ApplicationRecord

  # validation
  validates :first_name,            presence: true, length: {maximum: 20}, on: :validates_create_user
  validates :last_name,             presence: true, length: {maximum: 20}, on: :validates_create_user
  validates :kana_first_name,       presence: true, length: {maximum: 20}, on: :validates_create_user
  validates :kana_last_name,        presence: true, length: {maximum: 20}, on: :validates_create_user
  validates :birthday_year,         presence: true, on: :validates_create_user
  validates :birthday_month,        presence: true, on: :validates_create_user
  validates :birthday_day,          presence: true, on: :validates_create_user
  validates :phone_number,          presence: true, length: {maximum: 20}, on: :validates_create_phone
  
  # assosiation
  belongs_to :user, optional: true
end
