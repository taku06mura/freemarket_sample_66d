class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }

  validates :email,                 presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i }
  validates :password_confirmation, presence: true, length: {minimum: 7, maximum: 128}
  validates :nickname,              presence: true, length: {maximum: 20}

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :personal_datum, dependent: :destroy
  accepts_nested_attributes_for :personal_datum
  
  
end
