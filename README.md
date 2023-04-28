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

<!-- ## comments 
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_id   | integer    | primary_key                    |
| post_id      | references | null: false, foreign_key: true |
| commenter_id | references | null: false, foreign_key: true |
| comment_text | text       | null: false                    |
| comment_time | datetime   | null: false                    | -->


# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| motorcycle_model   | string  | null: false |
| self_introduction  | text    |             |
### Association
has_many :user_rooms
has_many :rooms, through: :user_rooms
has_many :messages
has_many :user_follows
has_many :follower_relationships, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
has_many :followers, through: :follower_relationships, source: :follower
has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
has_many :followings, through: :following_relationships, source: :following
<!-- 中間テーブル -->
## user_rooms テーブル
| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
|user_id          |	references |	null: false, foreign_key: true|
|room_id	        | references | 	null: false, foreign_key: true|
### Association
  belongs_to :user
  belongs_to :room

## rooms テーブル

| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| name            | string     | null: false                    |
| creator_id      | references | null: false, foreign_key: true |
| room_id         | integer    | primary_key                    |
### Association
has_many :user_rooms, dependent: :destroy
has_many :users, through: :user_rooms
has_many :messages, dependent: :destroy
has_many :room_searches, dependent: :destroy
has_many :searches, through: :room_searches

##  messages テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | primary_key                    |
| room         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
### Association
belongs_to :room
belongs_to :user

## follows テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
|user_id      | integer    | primary_key                    |
|follower_id  | references | null: false, foreign_key: true |
|following_id | references | null: false, foreign_key: true |
### Association
belongs_to :follower, class_name: "User"
belongs_to :following, class_name: "User"
<!-- 中間テーブル -->

## user_follows　テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
|follower_id  | references | null: false, foreign_key: true |
|following_id | references | null: false, foreign_key: true |
### Association


## Searches テーブル
| Column         | Type   　| Options     |
| -------------- | -------- | ----------- |
| search_id      | integer　| primary_key |
| search_keyword | string　 | null: false |
### Association
has_many :room_searches, dependent: :destroy
has_many :rooms, through: :room_searches
<!-- 中間テーブル -->
## Room_searches テーブル

| Column         | Type     　| Options                        |
| -------------- | --------   | ------------------------------ |
| search_id      | references | null: false, foreign_key: true |
|   room_id 　　　| references | null: false, foreign_key: true |

### Association
belongs_to :room
belongs_to :search