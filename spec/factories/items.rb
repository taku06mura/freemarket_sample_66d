FactoryBot.define do
  factory :item do
    saler_id         {"1"}
    buyer_id         {"2"}
    name             {"yosida"}
    item_discription {"Hello"}
    category_id      {"22"}
    size             {"S"}
    brand_name       {"adidas"}
    quolity          {"未使用に近い"}
    price            {"500"}
    carriage_fee     {"着払い"}
    prefecture       {"沖縄県"}
    delivery         {"未定"}
    days             {"1~2日で発送"}
  end
end
