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


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| price                               | integer    | null: false                    |
| text                                | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| status_id                           | integer    | null: false                    |
| delivery_charge_id                  | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| shipping_date_id                    | integer    | null: false                    |
| user                                | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | reference  | null: false, foreign_key: true |
| item            | reference  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | reference  | null: false, foreign_key: true |

### Association

- belongs_to :purchase
