# README

# freemarket_sample_66d DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false,index: true|
### Association
- has_many :addresses dependent: :destroy
- has_many :credits dependent: :destroy
- has_many :sns_users dependent: :destroy
- has_many :items dependent: :destroy
- has_many :comments dependent: :destroy
- belongs_to :profile dependent: :destroy

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer|string|null: false, foreign_key: true|
|card_id|string|null: false, foreign_key: true|
### Association
- belongs_to :user

## authテーブル
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
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false,index: true|
|parent|integer||
### Association
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_name|string|null: false|
|item_discription|string|null: false|
|category_id|integer|null: false|
|quality|string|null: false|
|prefectures|string|null: false|
|price|integer|null: false|
|brand_id|integer|null: false,index: true|
|size|string|null: false|
|carriage_fee|integer|null: false|
### Association
- has_many :images dependent: :destroy
- has_many :comments dependent: :destroy
- belongs_to :user
- belongs_to :brand
- belongs_to :category

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item_id|integer|null: false|
|user_id|integer|null: false,index: true|
### Association
- belongs_to :user
- belongs_to :item

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|selfintroduction|text|null: false|
|user_id|integer|null: false,index: true|
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
|user_id|integer|null: false,index: true|
### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false|
### Association
- belongs_to :item

## personal_dateテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false,index: true|
|kana_last_name|string|null: false,index: true|
|birthday|string|null: false,index: true|
|phone_number|string|null: false,index: true|
|user_id|integer|null: false,index: true|
### Association
- belongs_to :user

