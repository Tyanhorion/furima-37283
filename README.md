# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| nick_name             | string | NOT null     |
| email                 | string | unique: true |
| encrypted_password    | string | NOT null     |
| birthday              | date   | NOT null     |
| last_name             | string | NOT null     |
| first_name            | string | NOT null     |
| last_name_kana        | string | NOT null     |
| first_name_kana       | string | NOT null     |

### Association
- has_many :items
- has_many :buys



##　items テーブル
|Column|Type|Options|
|------|----|-------|
| item_name          | string     | NOT null    |
| explanation        | text       | NOT null    |
| price              | integer    | NOT null    |
| delivery_id        | integer    | NOT null    |
| areas_id           | integer    | NOT null    |
| user               | references | NOT null    |
| category_id        | integer    | NOT null    |
| situation_id       | integer    | NOT null    |
| days_id            | integer    | NOT null    |

### Association
- belongs to :user
- belongs to :buys



## buys テーブル
|Column|Type|Options|
|------|----|-------|
| item               | references | NOT null, foreign_key: true    |
| user               | references | NOT null, foreign_key: true    |

### Association
- has_many :items
- belongs to :addresses
- belongs to :user



## addresses テーブル
|Column|Type|Options|
|------|----|-------|
| postal_code        | string     | NOT null          |
| prefectures_id     | integer    | NOT null          |
| municipalities     | string     | NOT null          |
| address            | string     | NOT null          |
| building_name      | string     |                   |
| telephone          | string     | NOT null          |
| buys               | references | foreign_key: true |

### Association
- has_many :items
- belongs to :user