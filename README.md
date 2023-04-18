# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| bike model         | string  | null: false |
| self_introduction  | text    |             |
| user_id            | integer | primary_key |

## chat_rooms テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| chatroom_name   | string     | null: false                    |
| creator_id      | references | null: false, foreign_key: true |
| chatroom_id     | integer    | primary_key                    |


##  chat_messages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| message_id   | string     | primary_key                    |
| chatroom_id  | references | null: false, foreign_key: true |
| sender_id    | references | null: false, foreign_key: true |
| message_text | text       | null: false

## comments 
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_id   | integer    | primary_key                    |
| post_id      | references | null: false, foreign_key: true |
| commenter_id | references | null: false, foreign_key: true |
| comment_text | text       | null: false                    |
| comment_time | datetime   | null: false                    |

## follows table
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
|follow_id    | integer    | primary_key                    |
|follower_id  | references | null: false, foreign_key: true |
|following_id | references | null: false, foreign_key: true |

## Searches table
| Column         | Type   　| Options     |
| -------------- | -------- | ----------- |
| search_id      | integer　| primary_key |
| search_keyword | string　 | null: false |