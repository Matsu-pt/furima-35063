#テーブル設計

## users table
| Column               | Type    | Option                    |
| -------------------- | --------| ------------------------- |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| nickname             | string  | null: false               |
| first_name           | string  | null: false               |
| family_name          | string  | null: false               |
| first_name_ruby      | string  | null: false               |
| family_name_ruby     | string  | null: false               |
| birth_day            | date    | null: false               |

### Association
* has_many :items
* has_many :purchases

## items table
| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| explanation      | text       | null: false       |
| price            | integer    | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| shipping_area_id | integer    | null: false       |
| shipping_day_id  | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table
| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| item          | references | foreign_key: true |
| user          | references | foreign_key: true |

### Association

- has_one :delivery
- belongs_to :user
- belongs_to :item

## deliveries table
| Column             | Type      | Option            |
| ------------------ | --------- | ----------------- |
| postal_code        | string    | null: false       |
| shipping_area_id   | integer   | null: false       |
| municipality       | string    | null: false       |
| address            | string    | null: false       |
| build              | string    |                   |
| phone_number       | string    | null: false       |
| purchase           | references| foreign_key: true |

###
- belongs_to :purchase