# DB 設計

## users table

| Column                | Type                | Options                 |
|-----------------------|---------------------|-------------------------|
| nickname              | string              | null: false             |
| email                 | string              | null: false             |
| password              | string              | null: false             |
| password_confirmation | string              | null: false             |
| last_name             | string              | null: false             |
| first_name            | string              | null: false             |
| last_name_kana        | string              | null: false             |
| first_name_kana       | string              | null: false             |
| birth_year            | string              | null: false             |
| birth_month           | string              | null: false             |
| birth_date            | string              | null: false             |



### Association

* has_many :items dependent: :destroy
* has_one  :buyer
* has_one  :credit_card


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| price                               | string     | null: false       |
| text                                | text       | null: false       |
| category                            | string     | null: false       |
| status                              | string     | null: false       |
| delivery_charge                     | string     | null: false       |
| shipping_area                       | string     | null: false       |
| shipping_date                       | string     | null: false       |

### Association

- belongs_to :user


## credit_cards table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user_id         | reference  | null: false, foreign_key: true |
| buyer_id        | string     | null: false                    |
| credit_card_id  | references | null: false                    |

### Association

- belongs_to :user