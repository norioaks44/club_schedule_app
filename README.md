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
| nickname            | string  | null: false |
| email               | string  | null: false |
| password_encrypted  | string  | null: false |
| class_year          | integer | null: false |

### Association
- has_many :events
- has_many :comments

## events テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| comment         | references | null: false, foreign_key: true |
| title_id        | integer    | null: false                    |
| info            | string     | null: false                    |
| start_time      | date       | null: false                    |
| meeting_time_id | integer    | null: false                    |

### Association
- belongs_to :user
- has_many :comments
