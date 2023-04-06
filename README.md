# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| read_family        | string | null: false               |
| read_first         | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :orders 


## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| content            | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| shopping_cost_id   | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| preparation_day_id | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
- belong_to :user
- has_one :order 
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shopping_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day


## categories テーブル

| Column             | Type        | Options      |
| ------------------ | ----------- | ------------ |
| category           | string      | null: false  |

### Association
- has_many :items


## conditions テーブル

| Column          | Type        | Options       |
| --------------- | ----------- | ------------- |
| condition       | string      | null: false   |

### Association
- has_many :items


## prefectures テーブル

| Column         | Type        | Options        |
| -------------- | ----------- | -------------- |
| prefecture     | string      | null: false    |

### Association
- has_many :items
- has_many :deliver_addresses


## preparation_days テーブル

| Column              | Type        | Options        |
| ------------------- | ----------- | -------------- |
| preparation_day     | string      | null: false    |

### Association
- has_many :items



## deliver_addresses テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| post_code          | string      | null: false                    |
| prefecture_id      | integer     | null: false                    |
| city               | string      | null: false                    |
| address1           | string      | null: false                    |
| address2           | string      |                                |
| phon_number        | string      | null: false                    |
| order              | references  | null: false, foreign_key: true |

### Association

- belong_to :order
- belong_to :prefecture


## orders テーブル  <!--credit_cardsからordersに変更.ブランチを切り替える前にプッシュしてしまったためコメント記載-->

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :item
- has_one :deliver_address
