# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| nick-name             | string | NOT null     |
| email                 | string | unique: true |
| encrypted-password    | string | NOT null     |
| birthday              | date   | NOT null     |
| last-name             | string | NOT null     |
| first-name            | string | NOT null     |
| last-name-kana        | string | NOT null     |
| first-name-kana       | string | NOT null     |

##　items テーブル
|Column|Type|Options|
|------|----|-------|
| item-name          | string     | NOT null    |
| explanation        | text       | NOT null    |
| price              | integer    | NOT null    |
| delivery_id        | integer    | NOT null    |
| areas_id           | integer    | NOT null    |
| user               | references | NOT null    |
| category_id        | integer    | NOT null    |
| situation_id       | integer    | NOT null    |
| days_id            | integer    | NOT null    |




## buys テーブル
|Column|Type|Options|
|------|----|-------|
| items              | references | NOT null, foreign_key: true    |
| user               | references | NOT null, foreign_key: true    |

## addresses テーブル
|Column|Type|Options|
|------|----|-------|
| postal-code        | string | NOT null    |
| prefectures        | string | NOT null    |
| municipalities     | string | NOT null    |
| address            | string | NOT null    |
| building-name      | string | NOT null    |
| telephone          | string | NOT null    |
| user               | references | NOT null, foreign_key: true |
| buys               | references | NOT null, foreign_key: true |