class Address < ApplicationRecord

  # validation
  validates :postal_code,             presence: true, length: {maximum: 10}, format: {with: /\A[0-9]{7}\z/}
  validates :prefecture,              presence: true, length: {maximum: 30}
  validates :municipality,            presence: true, length: {maximum: 30}
  validates :house_number,            presence: true, length: {maximum: 100}
  validates :building_name,           length: {maximum: 100}

  # assosiation
  belongs_to :user, optional: true
end
