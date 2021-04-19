# DB 設計

## users table

| Column               | Type                | Options                   |
|----------------------|---------------------|---------------------------|
| nickname             | string              | null: false               |
| email                | string              | null: false, unique: true |
| encrypted_password   | string              | null: false               |
| family_name          | string              | null: false               |
| first_name           | string              | null: false               |
| family_name_kana     | string              | null: false               |
| first_name_kana      | string              | null: false               |
| birth_day            | date                | null: false               |

### Association

- has_many :items dependent: :destroy
- has_many :purchase dependent: :destroy

## destination table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| post_code                           | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| city                                | string     | null: false                    |
| address                             | string     | null: false                    |
| building_name                       | string     |                     |
| phone_number                        | string     | null: false                    |
| purchase_id                         | integer    | null: false, foreign_key: true |



### Association




## item table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null:false                     |
| price                               | integer    | null: false                    |
| description                         | text       | null: false                    |
| states_id                           | integer    | null: false                    |
| shipping_cost_id                    | integer    | null: false                    |
| shipping_days_id                    | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| user_id                             | integer    | null: false, foreign_key: true |
| category_id                         | integer    | null: false                    |

### Association
- has_one :purchase
- belongs_to :user dependent: :destroy
- belongs_to_active_hash :prefecture, states, shipping_cost, shipping_days, category

## purchase table

| Column                        | Type       | Options                        |
|-------------------------------|------------|--------------------------------|
| user_id                       | integer    | null: false, foreign_key: true |
| item_id                    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :items dependent: :destroy
- belongs_to :user dependent: :destroy
