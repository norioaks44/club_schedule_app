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

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| email               | string  | null: false |
| password_encrypted  | string  | null: false |
| grade_id            | integer | null: false |
| position_id         | integer | null: false |

### Association
- has_many :events
- has_many :skills
- has_many :reviews

## events テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| title_id        | integer    | null: false                    |
| info            | text       | null: false                    |
| start_time      | date       | null: false                    |
| meeting_time_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :review

## skills テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| drill_name      | string     | null:false                     |
| info            | string     | null:false                     |
| category_id     | integer    | null:false                     |
| genre_id        | integer    | null:false                     |

### Association
- belongs_to :user

## reviews テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| event           | references | null: false, foreign_key: true |
| comment         | text       | null:false                     |
| match_url       | text       |                                |

### Association
- belongs_to :user
- belongs_to :event
