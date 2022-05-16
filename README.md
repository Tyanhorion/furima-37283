# README

## users テーブル
|Column|Type|Options|
|------|----|-------|
| name                  | string | NOT null    |
| nick_name             | string | NOT null    |
| email     　　　　　　  | string | unique: true    |
| encrypted_password    | string | NOT null    |
| birthday              | string | NOT null    |




##　item テーブル
|Column|Type|Options|
|------|----|-------|
| item_name          | string | NOT null    |
| image              | string | NOT null    |
| explanation        | string | NOT null    |
| price              | string | NOT null    |
| delivery           | string | NOT null    |
| areas              | string | NOT null    |
| user               | references | NOT null    |
| category           | string | NOT null    |
| situation          | string | NOT null    |
| days               | string | NOT null    |




## buy テーブル
|Column|Type|Options|
|------|----|-------|
| item               | references | NOT null, foreign_key: true    |
| user               | references | NOT null, foreign_key: true    |

## address テーブル
|Column|Type|Options|
|------|----|-------|
| address            | string | NOT null    |
| tel                | string | NOT null    |
| user               | references | NOT null, foreign_key: true    |