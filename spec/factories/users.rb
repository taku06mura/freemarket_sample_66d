FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"password1"}
    password_confirmation {"password1"}
  end
end