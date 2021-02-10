## usersテーブル

|Column          |Type   |Options     |
|----------------|-------|------------|
|nickname        |string |null: false |
|email           |string |unique: true|
|password        |string |null: false |
|family_name     |string |null: false |
|first_name      |string |null: false |
|family_name_kana|string |null: false |
|first_name_kana |string |null: false |
|birth_day       |integer|null: false |

## Association

has_many:product
has_one:destination


## destinationテーブル

|Column       |Type   |Options    |
|-------------|-------|-----------|
|post_code    |integer|null: false|
|prefecture   |string |null: false|
|city         |string |null: false|
|address      |text   |null: false|
|building_name|text   |null: false|
|phone_number |integer|null: false|

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
|cost         |integer   |null: false                  |
|days         |integer   |null: false                  |

## Association

belongs_to:user


## record
|Column          |Type      |Options                      |
|----------------|----------|-----------------------------|
|family_name     |string    |null: false,foreign_key: true|
|first_name      |string    |null: false,foreign_key: true|
|family_name_kana|string    |null: false,foreign_key: true|
|first_name_kana |string    |null: false,foreign_key: true|

## Association

belongs_to:destination