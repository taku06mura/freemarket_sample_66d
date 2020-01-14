FactoryBot.define do
  factory :personal_datum do
    first_name            {"太郎"}
    last_name             {"山田"}
    kana_first_name       {"タロウ"}
    kana_last_name        {"ヤマダ"}
    birthday_year         {"1990"}
    birthday_month        {"1"}
    birthday_day          {"2"}
    phone_number          {"09011112222"}
    user_id               {"1"}
  end
end