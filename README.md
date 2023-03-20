# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| read_family        | string | null: false |
| read_first         | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_one :deliver_adress
- has_one :credit_card


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| name               | string | null: false |
| content            | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shopping_costs     | string | null: false |
| area               | string | null: false |
| preparatiion_days  | date   | null: false |
| price              | string | null: false |

### Association
- belong_to :user


## deliver_adress テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| post_code          | string | null: false                    |
| prefecture         | string | null: false                    |
| city               | string | null: false                    |
| adress1            | string | null: false                    |
| adress2            | string | null: false                    |
| phon_number        | string | null: false                    |
| user_id            | string | null: false, foreign_key: true |

### Association
- has_one: user


## dredit_card テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| card_id            | string  | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association
- has_one: user