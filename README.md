#テーブル設計

## usersテーブル

| Column     | Type          | Option                      |
| ---------- | ------------- | --------------------------- |
| email      | string        | null: false, , unique: true |
| password   | string        | null: false                 |
| name       | string        | null: false                 |
| profile    | text          | null: false                 |
| occupation | text          | null: false                 |
| position   | text          | null: false                 |

## prototypesテーブル

| column     | Type          | Option           |
| ---------- | ------------- |----------------- |
| title      | string        | null:false       |
| catch_copy | text          | null:false       |
| concept    | text          | null:false       |
| user       | references    | foreign_key:true |

## commentsテーブル

| colum      | Type          | Option           |
| ---------- | ------------- | ---------------- |
| text       | text          | null:false       |
| user       | references    | foreign_key:true |
| prototype  | references    | foreign_key:true |
