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



## items テーブル
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
| shipping_day_id    | integer    | null: false    |

### Association
- belongs_to :user
- has_one :buy



## buys テーブル
|Column|Type|Options|
|------|----|-------|
| item               | references | null: false, foreign_key: true    |
| user               | references | null: false, foreign_key: true    |

### Association
- has_one :address
- belongs_to :item
- belongs_to :user



## addresses テーブル
|Column|Type|Options|
|------|----|-------|
| postal_code        | string     | null: false          |
| prefecture_id      | integer    | null: false          |
| municipalities     | string     | null: false          |
| address            | string     | null: false          |
| building_name      | string     |                      |
| telephone          | string     | null: false          |
| buy                | references | null: false, foreign_key: true    |

### Association
- belongs_to :buy


sample.rbのマイグレーションの削除
１、ロールバックでダウンにして削除する

２、削除してから、データベースを作り直す
 1,不要なファイルの削除、マイグレーションの記述の変更
 2, rails db:migrate:reset

rails db:migrate:reset
1, rails db:drop
2, rails db:create
3, rails db:migrate

デメリット
１、データが全て消えるため、本番環境での使用には注意が必要。