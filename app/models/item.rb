class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, optional: true, class_name: "User"
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category
  enum prefecture:{
     "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
     沖縄県:47
   }
   validates :saler_id,         presence: true
   validates :name,             presence: true
   validates :item_discription, presence: true
   validates :category_id,      presence: true
   validates :size,             presence: true
   validates :quolity,          presence: true
   validates :price,            presence: true, numericality: { only_integer: true,

                                                greater_than: 300, less_than: 9999999
                                                
                                                }
   validates :carriage_fee,     presence: true
   validates :prefecture,       presence: true
   validates :delivery,         presence: true
   validates :days,             presence: true
   validates :images,           associated: true

   validate :require_any_images
    def require_any_images
      errors.add("画像が登録されていません") if images.blank?
    end

    def self.search(search)
      return　Item.all unless search
      Item.where('name LIKE ?', "%#{search}%")
    end
end
