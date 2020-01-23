crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :profile do
  link "プロフィール", edit_mypage_path
  parent :mypage
end

crumb :exhibiting do
  link "出品中", on_sale_mypage_path
  parent :mypage
end

crumb :method_of_payment do
  link "支払い方法", card_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_path
  parent :mypage
end