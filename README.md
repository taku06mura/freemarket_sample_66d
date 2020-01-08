# README

# freemarket_sample_66d DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false,index: true|
### Association
- has_many :addresses
- has_many :credits
- has_many :sns_users
- has_many :goods
- has_many :comments
- belongs_to :profile

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer|integer|null: false, foreign_key: true|
|card_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## sns_usersテーブル
|Column|Type|Options|
|------|----|-------|
|Provider|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|
### Association
- has_many :goods

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false,index: true|
|parent|string||
### Association
- has_many :goods

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false|
|goods_name|string|null: false|
|goods_discription|string|null: false|
|category|string|null: false|
|quality|string|null: false|
|prefectures|string|null: false|
|price|string|null: false|
|brand|string|null: false,index: true|
|size|string|null: false|
|carriage_fee|string|null: false|
### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :brand
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|goods|string|null: false|
|user_id|string|null: false,index: true|
### Association
- belongs_to :user
- belongs_to :good

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|selfintroduction|text|null: false|
### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|prefectures|string|null: false|
|postal_code|string|null: false|
|municipality|string|null: false,index: true|
|address|string|null: false|
|building_name|string||
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|goods|string|null: false|
### Association
- belongs_to :good

## personal_dateテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false,index: true|
|kana_last_name|string|null: false,index: true|
|birthday|string|null: false,index: true|
|phone_number|string|null: false,index: true|
### Association
- belongs_to :user

