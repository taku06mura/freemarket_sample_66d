require 'rails_helper'

describe Item do
  describe '#create' do
    # 1. saler_idが空では登録できないこと
    it "is invalid without a saler_id" do
      item = build(:item, saler_id: nil)
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end
    # 2. nameが空では登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 3. item_discriptionが空では登録できないこと
    it "is invalid without a item_discription" do
      item = build(:item, item_discription: nil)
      item.valid?
      expect(item.errors[:item_discription]).to include("can't be blank")
    end

    # 4. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # 5. sizeが空では登録できないこと
    it "is invalid without a size" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end


    # 7. quolity  が空では登録できないこと
    it "is invalid without a quolity" do
      item = build(:item, quolity: nil)
      item.valid?
      expect(item.errors[:quolity ]).to include("can't be blank")
    end

     # 8. priceが空では登録できないこと
     it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price ]).to include("can't be blank")
    end

    # 9. carriage_feeが空では登録できないこと
    it "is invalid without a carriage_fee" do
      item = build(:item, carriage_fee: nil)
      item.valid?
      expect(item.errors[:carriage_fee ]).to include("can't be blank")
    end

     # 10. prefectureが空では登録できないこと
     it "is invalid without a prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture ]).to include("can't be blank")
    end

     # 11. deliveryが空では登録できないこと
     it "is invalid without a delivery" do
      item = build(:item, delivery: nil)
      item.valid?
      expect(item.errors[:delivery]).to include("can't be blank")
    end

    # 11. daysが空では登録できないこと
    it "is invalid without a days" do
      item = build(:item, days: nil)
      item.valid?
      expect(item.errors[:days ]).to include("can't be blank")
    end
  end
end
