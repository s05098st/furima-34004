## usersテーブル

|Column            |Type   |Options                |
|------------------|-------|-----------------------|
|nickname          |string |null: false            |
|email             |string |null:false,unique: true|
|encrypted_password|string |null: false            |
|family_name       |string |null: false            |
|first_name        |string |null: false            |
|family_name_kana  |string |null: false            |
|first_name_kana   |string |null: false            |
|birth_day         |date   |null: false            |

## Association

has_many:items
has_many:records


## destinationsテーブル

|Column       |Type   |Options                      |
|-------------|-------|-----------------------------|
|post_code    |string |null: false                  |
|prefecture_id|integer|null: false                  |
|city         |string |null: false                  |
|address      |string |null: false                  |
|building_name|string |                             |
|phone_number |string |null: false                  |
|record_id    |integer|null: false,foreign_key: true|


## Association

belongs_to:record


## itemsテーブル

|Column       |Type      |Options                    |
|-------------|----------|---------------------------|
|name         |string    |null: false                |
|description  |text      |null: false                |
|category_id  |integer   |null: false                |
|condition_id |integer   |null: false                |
|prefecture_id|integer   |null: false                |
|price        |integer   |null: false                |
|cost_id      |integer   |null: false                |
|days_id      |integer   |null: false                |
|user_id      |integer   |null:false,foreign_key:true|

## Association

belongs_to:user
has_one:record

## orders
|Column     |Type       |Options                      |
|-----------|-----------|-----------------------------|
|item       |references |null: false,foreign_key: true|
|user       |references |null: false,foreign_key: true|

## Association

has_one:destination
belongs_to:user
belongs_to:item
