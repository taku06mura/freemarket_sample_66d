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

# crumb :logout do
#   link "ログアウト", logout_mypages_path
#   parent :mypage
# end