# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| nick_name             | string | null: false     |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false     |
| birthday              | date   | null: false     |
| last_name             | string | null: false     |
| first_name            | string | null: false     |
| last_name_kana        | string | null: false     |
| first_name_kana       | string | null: false     |

### Association
- has_many :items
- has_many :buys



##　items テーブル
|Column|Type|Options|
|------|----|-------|
| item_name          | string     | null: false    |
| explanation        | text       | null: false    |
| price              | integer    | null: false    |
| delivery_id        | integer    | null: false    |
| prefecture_id      | integer    | null: false    |
| user               | references | null: false    |
| category_id        | integer    | null: false    |
| situation_id       | integer    | null: false    |
| shipping_days_id   | integer    | null: false    |

### Association
- belongs to :user
- has_many :buys



## buys テーブル
|Column|Type|Options|
|------|----|-------|
| item               | references | null: false, foreign_key: true    |
| user               | references | null: false, foreign_key: true    |

### Association
- has_many :addresses
- belongs to :items
- belongs to :user



## addresses テーブル
|Column|Type|Options|
|------|----|-------|
| postal_code        | string     | null: false          |
| prefecture_id      | integer    | null: false          |
| municipalities     | string     | null: false          |
| address            | string     | null: false          |
| building_name      | string     |                   |
| telephone          | string     | null: false          |
| buy                | references | foreign_key: true |

### Association
- belongs_to :buys