class Address < ApplicationRecord

  validates :postal_code,             presence: true, length: {maximum: 10}, format: {with: /\A[0-9]{7}\z/}
  validates :prefecture,              presence: true, length: {maximum: 30}
  validates :city,                    presence: true, length: {maximum: 30}
  validates :address,                 presence: true, length: {maximum: 100}

  belongs_to :user, optional: true
end
