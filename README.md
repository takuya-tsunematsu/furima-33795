# DB 設計

## users table

| Column                | Type                | Options                  |
|-----------------------|---------------------|--------------------------|
| nickname              | string              | null: false              |
| email                 | string              | null: false,unique: true |
| encrypted_password    | string              | null: false              |
| last_name             | string              | null: false              |
| first_name            | string              | null: false              |
| last_name_kana        | string              | null: false              |
| first_name_kana       | string              | null: false              |
| birth_day             | date                | null: false              |


### Association

* has_many :items dependent: :destroy
* has_many :purchases
* has_one  :credit_card


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| price                               | integer    | null: false                    |
| text                                | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| status_id                           | integer    | null: false                    |
| delivery_charge_id                  | integer    | null: false                    |
| shipping_area_id                    | integer    | null: false                    |
| shipping_date_id                    | integer    | null: false                    |
| user_id                             | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | reference  | null: false, foreign_key: true |
| item_id         | reference  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| purchase_id     | reference  | null: false, foreign_key: true |

### Association

- belongs_to :purchase


## credit_cards table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | reference  | null: false, foreign_key: true |
| credit_card_id  | references | null: false                    |

### Association

- belongs_to :user