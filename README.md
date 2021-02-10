## usersテーブル

|Column          |Type   |Options                |
|----------------|-------|-----------------------|
|nickname        |string |null: false            |
|email           |string |null:false,unique: true|
|password        |string |encrypted_password     |
|family_name     |string |null: false            |
|first_name      |string |null: false            |
|family_name_kana|string |null: false            |
|first_name_kana |string |null: false            |
|birth_day       |date   |null: false            |

## Association

has_many:products
has_one:record


## destinationテーブル

|Column       |Type   |Options                      |
|-------------|-------|-----------------------------|
|post_code    |integer|null: false                  |
|prefecture   |string |null: false                  |
|city         |string |null: false                  |
|address      |text   |null: false                  |
|building_name|text   |null: false                  |
|phone_number |integer|null: false                  |
|user_id      |string |null: false,foreign_key: true|
|product_id   |string |null: false,foreign_key: true|

## Association

has_one:record


## productテーブル

|Column       |Type      |Options                      |
|-------------|----------|-----------------------------|
|image        |references|null: false,foreign_key: true|
|name         |string    |null: false                  |
|description  |text      |null: false                  |
|category_id  |reference |null: false,foreign_key: true|
|condition    |text      |null: false,foreign_key: true|
|prefecture   |string    |null: false                  |
|price        |integer   |null: false                  |
|cost_id      |integer   |null: false                  |
|days_id      |integer   |null: false                  |

## Association

belongs_to:user
has_one:record

## record
|Column          |Type      |Options                      |
|----------------|----------|-----------------------------|
|product_id      |string    |null: false,foreign_key: true|
|user_id         |string    |null: false,foreign_key: true|

## Association

belongs_to:destination
belongs_to:user
belongs_to:product
