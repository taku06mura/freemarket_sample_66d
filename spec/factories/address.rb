FactoryBot.define do
  factory :address do
    postal_code           {"1008111"}
    prefecture            {"東京都"}
    municipality          {"千代田区"}
    house_number          {"千代田1-1"}
    building_name         {"皇居"}  
    user_id               {"1"}
  end
end